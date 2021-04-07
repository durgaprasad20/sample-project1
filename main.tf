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
