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

resource "azurerm_network_security_group" "mysg1" {
  name                = "sg-subnet1"
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  security_rule {
    name                       = "http-out"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    DeployedUsing = "Terraform"
    Repo          = "Azure-network-study"
    Deploy        = "02 - Playing with VNETs"
  }

  resource "azurerm_network_security_rule" "mysg1-rule1" {
    name                        = "https-out"
    priority                    = 101
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "443"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.myresourcegroup.name
    network_security_group_name = azurerm_network_security_group.myresourcegroupe.name
  }

}
