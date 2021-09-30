resource "azurerm_subnet" "mysubnet1" {
  name                 = var.subnet1-name
  resource_group_name = var.rg-name
  virtual_network_name = var.vnet-name
  # resource_group_name  = azurerm_resource_group.mysubnet1.name
  # virtual_network_name = azurerm_virtual_network.mysubnet1.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
