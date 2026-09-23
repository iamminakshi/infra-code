resource_groups = {

  rg1 = {
    name     = "poc-rg"
    location = "Central US"

    tags = {
      environment = "dev"
      project     = "terraform-poc"
    }
  }
}

storage_accounts = {

  storage1 = {
    name                     = "pocstorageaccount01"
    resource_group_name      = "poc-rg"
    location                 = "Central US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

virtual_networks = {

  vnet1 = {
    name                = "poc-vnet"
    location            = "Central US"
    resource_group_name = "poc-rg"

    address_space = [
      "10.0.0.0/16"
    ]
  }

}

subnets = {

  subnet1 = {
    name                 = "web-subnet"
    resource_group_name  = "poc-rg"
    virtual_network_name = "poc-vnet"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }
}

container_registries = {

  acr1 = {
    name                = "pocacrregistry01"
    resource_group_name = "poc-rg"
    location            = "Central US"
    sku                 = "Basic"
    admin_enabled       = false
  }
}

## application_gateways

application_gateways = {

  appgw1 = {
    name                 = "poc-appgw-01"
    location             = "Central US"
    resource_group_name  = "poc-rg"
    subnet_id            = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/poc-rg/providers/Microsoft.Network/virtualNetworks/poc-vnet/subnets/appgw-subnet"
    public_ip_address_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/poc-rg/providers/Microsoft.Network/publicIPAddresses/poc-appgw-pip"

    sku_name = "Standard_v2"
    sku_tier = "Standard_v2"
    capacity = 2

    backend_ip_addresses = [
      "10.0.2.10",
      "10.0.2.11"
    ]
  }

}
