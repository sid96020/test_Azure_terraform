resource "azurerm_resource_group" "example" {
  name     = "atp-example-test_threat_protection"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                = "examplestorage"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "example"
  }
}

resource "azurerm_advanced_threat_protection" "example" {
  target_resource_id = azurerm_storage_account.example.id
  enabled            = true
}