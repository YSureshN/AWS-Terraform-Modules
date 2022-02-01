provider "azurerm" {
  features {}
}
#  Terraform Settings Block
terraform {
  #  Required Terraform Providers  
  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "2.56.0"
    }
  }
}