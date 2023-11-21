terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "3799efb1-2d6e-4bf4-88c6-109499d22939"
  client_id       = "fbf5b429-c23d-4d8d-b4a0-e5616b908163"
  client_secret   = "6zb8Q~k6hGgbxhpi7pHyE1zhz1onGBxy.Cv1VbLe"
  tenant_id       = "184c5bf4-d7c1-43d3-849f-ddbd712368ed"
  features{}
}

variable "storage_account_name" {
  type        = string
  description = "description"
}

resource "azurerm_resource_group" "app_grp" {
  name = "app_grp"
  location = "North Europe"


}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = "app_grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
   depends_on = [
    azurerm_resource_group.app_grp
  ]

}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = var.storage_account_name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}

resource "azurerm_storage_blob" "sample" {
  name                     = "sample.txt"
  storage_account_name     = var.storage_account_name
  storage_container_name   = "data"
  type                     = "Block"
  source                   = "sample.txt"

}
