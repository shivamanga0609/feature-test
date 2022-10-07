#Creating Resource group name : Dev-Terraform-rg
locals {
  Owner           = "shiva"
  Reason          = "ticker-123"
  Environment     = "Dev"
  common_tags = {
    Owner       = "Shiva"
    Reason      = "ticker-123"
    Environment = "Dev"
  }
}
#terraform {
#  required_version = ">= 1.0.0"
#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = "2.64.0"
#    }
#    random = {
#      source  = "hashicorp/random"
#      version = ">= 3.0"
#    }
#  }
#}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
#Creating virtual network : Dev-Terraform-vnet

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

#Creating subnet : Dev-Terraform-subnet

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Creating Resource group name : Dev-Terraform-nsg 

resource "azurerm_network_security_group" "network_security_group" {
  name                       = var.network_security_group_name
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# For creating Multiple Security rules, refer https://thomasthornton.cloud/2020/08/05/network-security-group-rule-creation-using-terraform/

#Creating public IP  : Dev-publicip

resource "azurerm_public_ip" "public_ip" {
  name                       = var.public_ip_name
  resource_group_name        = azurerm_resource_group.resource_group.name
  location                   = azurerm_resource_group.resource_group.location
  allocation_method          = "Static"

  tags = {
    environment = "Dev"
  }
}
#Creating Resource group name : Dev-Terraform-nic

resource "azurerm_network_interface" "network_interface" {
  name                          = var.network_interface_name
  location                      = azurerm_resource_group.resource_group.location
  resource_group_name           = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

#Creating virtual machine : Dev-Terraform-vm 

resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.resource_group.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "azureuser123"
    admin_password = "Password12345!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "dev"
  }
}
#Creating Inbound rule 22 : Dev-nic_nsg
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
#  name                      = var.nic_nsg_name
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}
#resource "azurerm_lb" "loadbalancer" {
#  name                = var.loadbalancer_name
#  location            = azurerm_resource_group.resource_group.location
#  resource_group_name = azurerm_resource_group.resource_group.name

#  frontend_ip_configuration {
#    name                 = "PublicIPAddress"
#    public_ip_address_id = azurerm_public_ip.public_ip.id
#  }
#}
#resource "azurerm_storage_account" "storage_account" {
#   name                     = var.storage_account_name
#   location                 = azurerm_resource_group.resource_group.location
#   resource_group_name      = azurerm_resource_group.resource_group.name
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
#}
