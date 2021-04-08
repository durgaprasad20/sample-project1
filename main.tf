resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.loc
}

resource "azurerm_virtual_network" "example" {
  name                = var.networkname
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.address
}

resource "azurerm_subnet" "example" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.prefix]
}


resource "azurerm_network_interface" "example" {
  name                = var.nic
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "example" {
  name                = var.pip
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
}

resource "azurerm_managed_disk" "example" {
  name                 = var.disk
  location             = var.loc
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = var.storage
  create_option        = var.crt
  disk_size_gb         = var.size

}
resource "random_id" "rid" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    resource_group=azurerm_resource_group.example.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "example" {
  name                     = "storages${random_id.rid.hex}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

}

resource "azurerm_storage_container" "example" {
  name                  = "container1"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
