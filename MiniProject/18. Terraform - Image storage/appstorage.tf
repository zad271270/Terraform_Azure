module "app_storage_module"{
    source="./modules/storage"
    resource_group_name=local.resource_group_name
    location=local.location    
    storage_account_name="appstore4656656"
    container_name="images"    
    container_access="blob"
    storage_account_exists=true
    blobs_binary_enabled=true
    blobs_binary={
        "Laptop.jpg"="./images/"
        "Mobile.jpg"="./images/"
        "Tab.jpg"="./images/"
    }
    depends_on = [
      module.general_module
    ]
}