output "networkname" {
  value = azurerm_virtual_network.example.name

}

output "rgname" {
  value = azurerm_resource_group.example.name

}

output "subnetname" {
  value = azurerm_virtual_network.example.name

}

output "nic" {
  value = azurerm_network_interface.example.name

}

output "pip" {
  value = azurerm_public_ip.example.name

}

output "disk" {
  value = azurerm_managed_disk.example.name

}


