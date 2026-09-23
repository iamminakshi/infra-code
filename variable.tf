variable "resource_groups" {
  description = "Resource groups to create"

  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  description = "Storage accounts to create"

  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "virtual_networks" {
  description = "Virtual networks to create"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  description = "Subnets to create"

  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "container_registries" {
  description = "Azure Container Registries to create"

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}

## application_gateways

variable "application_gateways" {
  description = "Application Gateway configuration"

  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_id            = string
    public_ip_address_id = string

    sku_name = string
    sku_tier = string
    capacity = number

    backend_ip_addresses = list(string)
  }))
}