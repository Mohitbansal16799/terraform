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
  feature{}
}

resource "azurerm_resource_group" "app_grp" {
  name = "app_grp"
  location = "North Europe"


}