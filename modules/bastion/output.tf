output "pub_ip_id" {
 value=azurerm_public_ip.pip_azure_bastion.*.id
}
output "vm_private_ip" {
value=azurerm_linux_virtual_machine.linux_vm.*.private_ip_address
}
output "nic_id" {
 value=azurerm_network_interface.bastion_nic.*.id
}