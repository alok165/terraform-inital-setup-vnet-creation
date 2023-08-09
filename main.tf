# Azure Provider source and version being used
terraform {
  required_version = ">= 1.5.4"  #This is the Terraform CLI version
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.68.0"  #This is the Azurerm CLI version
    }
  }

  
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # Please note client_id, secret, secret id and tenaid , subscription are moevd ot terraform workspace variable
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

