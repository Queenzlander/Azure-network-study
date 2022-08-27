# Deploy a VNET and two Subnets
# Dependencies - providers.tf and variables.tf
# NZDR, August 2022

resource "azurerm_resource_group" "myresourcegroup" {
  name     = var.rg_name
  location = var.location

  tags = {
    DeployedUsing = "Terraform"
    Repo          = "Azure-network-study"
    Deploy        = "01 - Basic Network Setup"
  }
}

resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnet1_name
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    DeployedUsing = "Terraform"
    Repo          = "Azure-network-study"
    Deploy        = "01 - Basic Network Setup"
  }
}
