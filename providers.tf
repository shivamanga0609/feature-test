provider "azurerm" {
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
    features {
        subscription_id = "5740e3cd-aee2-48a2-bafe-098b39cdac9b"
         client_id       = "f5df5aaf-8a3f-4b5b-80ab-339078d827c4"
         client_secret   = "nWK8Q~DGaVG-nmCjKnPgQCT4ipTIxgbixpkXhbrs"
         tenant_id       = "5bf7f43b-c6cb-4796-beef-1bada091eefc"
    }   
}
