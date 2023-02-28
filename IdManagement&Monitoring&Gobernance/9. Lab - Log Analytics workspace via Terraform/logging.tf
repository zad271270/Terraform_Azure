resource "azurerm_log_analytics_workspace" "vmworkspace" {
  name                = "vmworkspace30049"
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_virtual_machine_extension" "vmagent" {

  name                 = "vmagent"
  virtual_machine_id   = azurerm_windows_virtual_machine.appvm.id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"
  
  auto_upgrade_minor_version = "true"
  settings = <<SETTINGS
    {
      "workspaceId": "${azurerm_log_analytics_workspace.vmworkspace.workspace_id}"
    }
SETTINGS
   protected_settings = <<PROTECTED_SETTINGS
   {
      "workspaceKey": "${azurerm_log_analytics_workspace.vmworkspace.primary_shared_key}"
   }
PROTECTED_SETTINGS

depends_on = [
  azurerm_log_analytics_workspace.vmworkspace,
  azurerm_windows_virtual_machine.appvm
]
}

resource "azurerm_log_analytics_datasource_windows_event" "systemevents" {
  name                = "systemevents"
  resource_group_name = local.resource_group_name
  workspace_name      = azurerm_log_analytics_workspace.vmworkspace.name
  event_log_name      = "System"
  event_types         = ["Information"]

  depends_on = [
  azurerm_log_analytics_workspace.vmworkspace,
  azurerm_resource_group.appgrp
]
}