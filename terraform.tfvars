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