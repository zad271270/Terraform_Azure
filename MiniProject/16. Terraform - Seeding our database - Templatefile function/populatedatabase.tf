module "storage_module"{
    source="./modules/storage"
    resource_group_name=local.resource_group_name
    location=local.location
    storage_account_name="appstore4656656"
    container_name="scripts"
    app_container_name = "images"
    container_access="blob"
    blobs={
        "01.sql"="./dbscripts/"
        "Script.ps1"="./scripts/"
    }
    depends_on = [
      module.general_module
    ]
}

