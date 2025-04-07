terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-kv" {
  name     = var.name
  location = "West Europe"
}

resource "azurerm_key_vault" "example" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg-kv.name
  tenant_id                  = "da29c8e3-fccc-42a2-ab5c-5967b4fdfeb5"
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  # Habilitar RBAC en vez de políticas de acceso clásicas
  enable_rbac_authorization  = true
  purge_protection_enabled    = true
  public_network_access_enabled = true

    tags = {
    environment = "Development"  
  }

}

resource "azurerm_storage_account" "example" {
  name                     = var.name
  resource_group_name      = azurerm_resource_group.rg-kv.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false
  local_user_enabled = true
  public_network_access_enabled = true 

    tags = {
    environment = "Development"  
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = azurerm_resource_group.rg-kv.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
  public_network_access_enabled = true

  tags = {
    environment = "Development"
 }
}