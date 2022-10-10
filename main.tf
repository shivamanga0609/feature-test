locals {
  resource_prefix = "${var.Environment}-${var.location_short}"
  Owner           = var.Owner
  Reason          = var.Reason
  Environment     = var.Environment
  common_tags = {
    Owner       = local.Owner
    Reason      = local.Reason
    Environment = local.Environment
  }
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.64.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

#----------------
# RANDOM STRING
#----------------

resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = true
  lower   = true
}

#----------------
# RESOURCE GROUP
#----------------

resource "azurerm_resource_group" "resource_group" {
  name     = lower("${local.resource_prefix}-${var.resource_group_name}")
  location = var.location
  tags     = local.common_tags
}

#-----------------
# STORAGE ACCOUNT
#-----------------

resource "azurerm_storage_account" "blob_storage_account" {
  depends_on = [
    azurerm_resource_group.resource_group
  ]
  name                     = lower(replace("${local.resource_prefix}-${var.blob_storage_account_name}-${random_string.myrandom.id}", "-", ""))
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.blob_storage_account_tier
  account_replication_type = var.blob_storage_account_replication_type
  account_kind             = var.blob_storage_account_kind
  is_hns_enabled           = var.blob_storage_account_is_hns_enabled
  tags                     = local.common_tags
}

#----------------
# BLOB CONTAINER
#----------------

resource "azurerm_storage_container" "blob_storage_container" {
  depends_on = [
    azurerm_storage_account.blob_storage_account
  ]
  name                  = lower(replace("${local.resource_prefix}-${var.blob_storage_container_name}", "-", ""))
  storage_account_name  = azurerm_storage_account.blob_storage_account.name
  container_access_type = var.blob_storage_container_access_type
}
