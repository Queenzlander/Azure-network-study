# file for setting providers and other things that span all the other tf files
# this file should be farly consistant across all depolys in this repo be it network or some other type
# Dependencies - nil
# NZDR, August 2022

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.60.0"
    }
  }
}

provider "azurerm" {
  features {}
}
