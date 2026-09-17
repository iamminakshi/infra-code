resource "azurerm_resource_group" "rg" {

  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

resource "azurerm_storage_account" "storage" {

  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  depends_on =[azurerm_resource_group]
}

resource "azurerm_virtual_network" "vnet" {

  for_each = var.virtual_networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  depends_on =[azurerm_resource_group]
}

resource "azurerm_subnet" "subnet" {

  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  depends_on =[azurerm_resource_group, azurerm_virtual_network]
}

resource "azurerm_container_registry" "acr" {

  for_each = var.container_registries

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  depends_on =[azurerm_resource_group]
}