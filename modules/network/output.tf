output "vpc_name_bastion" {
  value = azurerm_virtual_network.vnet_bastion.name
}
output "vpc_name_cluster" {
  value = azurerm_virtual_network.vnet_cluster.*.name
}
output "bastion_id" {
  value = azurerm_virtual_network.vnet_bastion.*.id
}
output "vnet_id" {
  value = azurerm_virtual_network.vnet_cluster.*.id
}


