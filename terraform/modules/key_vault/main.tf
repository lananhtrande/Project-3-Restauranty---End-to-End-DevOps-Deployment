data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {

  name = var.name

  location = var.location

  resource_group_name = var.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  enabled_for_disk_encryption = true

  soft_delete_retention_days = 7

  purge_protection_enabled = false

}

resource "azurerm_role_assignment" "admin" {

  scope = azurerm_key_vault.this.id

  role_definition_name = "Key Vault Administrator"

  principal_id = data.azurerm_client_config.current.object_id

}