output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
}

output "virtual_network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "network_interface_name" {
  value = azurerm_network_interface.network_interface.name
}
output "network_security_group_name" {
    value = azurerm_network_security_group.network_security_group.name
}
output "virtual__machine_name" {
  value = azurerm_virtual_machine.virtual_machine.name
}
output "public_ip_name" {
  value = azurerm_public_ip.public_ip.name
}
#output "nic_nsg" {
#  value = azurerm_network_interface_security_group_association.nic_nsg.name
#}
#output "loadbalancer_name" {
#  value = azurerm_lb.loadbalancer.name
#}
#output "storage_account_name" {
#    value  = azurerm_storage_account.storage_account.name
#}
