resource "azurerm_resource_group" "rg1" {
  name = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  name = var.vnetname
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  address_space = var.addressspace
}

resource "azurerm_subnet" "s1" {
    name = var.subnetname
    resource_group_name = azurerm_resource_group.rg1.name
    address_prefixes = var.subnetaddressspace
    virtual_network_name = azurerm_virtual_network.vnet1.name
}