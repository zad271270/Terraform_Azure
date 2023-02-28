resource "azurerm_virtual_network" "network" {
  for_each = local.environment
  name                = "${each.key}-network"
  location            = local.location  
  resource_group_name = local.resource_group_name
  address_space       = [each.value]
  depends_on = [
    azurerm_resource_group.appgrp
  ]  

  subnet {
    name           = "${each.key}subnet"
    address_prefix = cidrsubnet(each.value,8,0)
  }
} 

