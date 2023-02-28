module "networking_module"{
    source="./networking"
    resource_group_name = "app-grp"
    location = "North Europe"
    virtual_network_name = "app-network"
    virtual_network_address_space = "10.0.0.0/16"
}

