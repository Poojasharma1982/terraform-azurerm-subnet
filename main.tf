resource "azurerm_subnet" "mysubnet1" {
  name                 = var.subnet1-name
  resource_group_name = var.rg_name_new
  virtual_network_name = var. vnet_name_new
  # resource_group_name  = azurerm_resource_group.mysubnet1.name
  # virtual_network_name = azurerm_virtual_network.mysubnet1.name
  virtual_network_address = var.prov-vnet_address
  # address_prefixes     = ["10.0.1.0/24"]
  address_prefixes = var.subnet1-address

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
