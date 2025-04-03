resource "azurerm_resource_group" "rg1" {
  name = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  resource_group_name = azurerm_resource_group.rg1.name
    name                = var.vnetname
    address_space       = var.addressspace
    location           = azurerm_resource_group.rg1.location
}

resource "azurerm_subnet" "s1" {
    name                 = var.subnetname
    resource_group_name  = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    address_prefixes     = var.subnetprefix
}