/*output "aks_cluster_id" {
  value = module.cluster.aks_cluster_id
}

output "aks_cluster_name" {
  value = module.cluster.aks_cluster_name
}*/
output "bastion_id" {
  value = module.network.bastion_id
}
output "vpc_subnet" {
  value = module.subnet.vpc_subnet
}
/*output "firewall_name" {
  value = module.firewall.firewall_name
}*/

