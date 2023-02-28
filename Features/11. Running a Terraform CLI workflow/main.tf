resource "azurerm_resource_group" "resourcegrp" {
  name     =local.resource_group_name
  location = local.location  
}

resource "azurerm_virtual_network" "network" {
  name                = local.virtual_network.name
  location            = local.location  
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]
  depends_on = [
    azurerm_resource_group.resourcegrp
  ]  
} 


resource "azurerm_subnet" "subnet" {    
    name                 = "SubnetA"
    resource_group_name  = local.resource_group_name
    virtual_network_name = local.virtual_network.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,8,0)]
    depends_on = [
      azurerm_virtual_network.network
    ]
}

