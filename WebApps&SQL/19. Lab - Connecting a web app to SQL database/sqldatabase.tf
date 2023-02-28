resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlserver400908"
  resource_group_name          = local.resource_group_name
  location                     = local.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Azure@3456"  
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_mssql_database" "appdb" {
  name           = "appdb"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2  
  sku_name       = "S0"  

 lifecycle {
    ignore_changes = [
      license_type
    ]
  }

  depends_on = [
    azurerm_mssql_server.sqlserver
      ]
  
}


resource "azurerm_mssql_firewall_rule" "allowmyclient" {
  name             = "AllowClientIP"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "86.98.123.24"
  end_ip_address   = "86.98.123.24"
  depends_on = [
    azurerm_mssql_server.sqlserver
  ]
}

resource "azurerm_mssql_firewall_rule" "allowservices" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  depends_on = [
    azurerm_mssql_server.sqlserver
  ]
}


