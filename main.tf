# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.80"
    }
  }

  required_version = ">= 0.14.9"
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "19918177-652b-4212-bd55-d104b45290e5"
  tenant_id       = "c0da05fc-d443-4445-9f3c-bcd2b45aeb1a"
  client_secret   = "6XM8Q~yPpicA8oeDWoBRHvscR3tOZVgd0WJugbnF"
  client_id       = "91e08505-aa26-43a3-9170-e435b8a1f0ff"
}
# Create a resource group
resource "azurerm_resource_group" "rgtest1" {
  name     = var.resource_group_name
  location = var.location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet_test1" {
  name                = "myTFResourceGroup-network"
  resource_group_name = azurerm_resource_group.rgtest1.name
  location            = azurerm_resource_group.rgtest1.location
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "test"
    costcenter  = "IT"
    project_id  = "A00978_TEST"
  }

}

