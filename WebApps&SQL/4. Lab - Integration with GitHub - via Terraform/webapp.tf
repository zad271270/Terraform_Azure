/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1. azurerm_app_service_source_control - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_source_control

*/

resource "azurerm_service_plan" "companyplan" {
  name                = "companyplan"
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = "Windows"
  sku_name            = "B1"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_windows_web_app" "companyapp1000" {
  name                = "companyapp1000"
  resource_group_name = local.resource_group_name
  location            = local.location
  service_plan_id     = azurerm_service_plan.companyplan.id

  site_config {
    application_stack {
      current_stack="dotnet"
      dotnet_version="v6.0"
    }
  }

  depends_on = [
    azurerm_service_plan.companyplan
  ]
}

# Please ensure to use your own GitHub URL

resource "azurerm_app_service_source_control" "appservice_sourcecontrol" {
  app_id   = azurerm_windows_web_app.companyapp1000.id
  repo_url = "https://github.com/alashro/webapp"
  branch   = "master"
  use_manual_integration = true
}