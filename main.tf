module "cluster" {
  source                          = ".//modules/cluster"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  count_value                     = var.count_value
  private_dns_name                = var.private_dns_name
  cluster_name                    = var.cluster_name
  dns_prefix_name                 = var.dns_prefix_name
  private_dnsregion_name          = var.private_dnsregion_name
  node_pool_name                  = var.node_pool_name
  #nodecount                      = var.nodecount
  vmsize                          = var.vmsize
  vnet_dns_id                     = module.network.vnet_id
  private_dns_bastion            = var.private_dns_bastion 
  vnet_cluster_revers_dns        = var.vnet_cluster_revers_dns 
  max_count                       = var.max_count
  min_count                       = var.min_count
  disk_size                       = var.disk_size
  type                            = var.type
  service_principal_clientsecret  = var.service_principal_clientsecret
  service_principal_clientid      = var.service_principal_clientid
  networkplug                     = var.networkplug
  loadbalancer_sku                = var.loadbalancer_sku
  networkpolicy                   = var.networkpolicy
  docker_bridge                   = var.docker_bridge
  dns_service                     = var.dns_service
  service_cid                     = var.service_cid
  addrees_prefixes                = module.subnet.vpc_subnet
  address_space                   = module.network.bastion_id
  vnet_cluster_space              = module.network.vnet_id
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name 
}
module "network" {
  source                          = ".//modules/network"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  bationloc                       = var.bationloc
  count_value                     = var.count_value
  vnet_name                       = var.vnet_name
  bastion_count_value             = var.bastion_count_value
  ddos_id                         = module.ddos.ddos_plan_id
  bastion_vnet_name               = var.bastion_vnet_name
  cluster_bastion_peering         = var.cluster_bastion_peering
  bastion_cluster_peering         = var.bastion_cluster_peering
  cluster_vnet_peering            =var.cluster_vnet_peering
  bastion_peering                 = var.bastion_peering
  reverse_cluster_peering         = var.reverse_cluster_peering
  cluster_vnet                    = var.cluster_vnet
  bastion_vnet                    = var.bastion_vnet
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name 
}
/*module "firewall" {
  source                          = ".//modules/firewall"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  count_value                     = var.count_value
  fw_name                         = var.fw_name
  network_rule_name               = var.network_rule_name
  subnet_id                       = module.subnet.fwsubnet_id
  fw_pub_allocation_method        = var.fw_pub_allocation_method
  fw_pub_sku                      = var.fw_pub_sku
  fw_pub_ip                       = var.fw_pub_ip  
  destination_addresses           = module.bastion.vm_private_ip
  fw_ip_config_name               = var.fw_ip_config_name
  priority_value                  = var.priority_value
  action_type                     = var.action_type
  rule_description                = var.rule_description
  rule_name                       = var.rule_name
  firewall_rule_source_addresses  = var.firewall_rule_source_addresses
  firewall_rule_destination_ports = var.firewall_rule_destination_ports
  firewall_protocols_type         = var.firewall_protocols_type
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name

}*/
module "ddos" {
  source                          = ".//modules/ddos"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  count_value                     = var.count_value
  ddos_name                       = var.ddos_name
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name
}
module "subnet" {
  source                          = ".//modules/subnet"
  resource_group_name             = var.resource_group_name
  count_value                     = var.count_value
  bastion_count_value             = var.bastion_count_value
  cluster_subnet                  = var.cluster_subnet
  subnet_name                     = var.subnet_name
  virtual_network_cluster_name    = module.network.vpc_name_cluster
  bastion_subnet_name             = var.bastion_subnet_name
  bastion_subnet                  = var.bastion_subnet
  virtual_network_bastion_name    = module.network.vpc_name_bastion
  bastionservice_subnet           = var.bastionservice_subnet
  bastionservice_subnet_name      = var.bastionservice_subnet_name

}
module "bastion" {
  source                          = ".//modules/bastion"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  bastion_count_value             = var.bastion_count_value
  nic_subnet_id                   = module.subnet.bastion_subnet_id
  lvm_size                        = var.lvm_size
  lvm_name                        = var.lvm_name
  bastion_admin_user              = var.bastion_admin_user
  bastion_admin_passwd            = var.bastion_admin_passwd
  bastion_nic_name                = var.bastion_nic_name
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name
  cache                           = var.cache
  storage_type                    = var.storage_type
  publish_type                    = var.publish_type
  offer_type                      = var.offer_type
  sku_type                        = var.sku_type
  version_type                    = var.version_type
  public_sku_type                 = var.public_sku_type
  public_ip_name                  = var.public_ip_name
  allocation_meth                 = var.allocation_meth
  bastion_host_name               = var.bastion_host_name
  ip_config_name                  = var.ip_config_name
  bastion_subnet_id               = module.subnet.bastionservice_subnet_id
  ip_allocation                   = var.ip_allocation
  ip_interface_configname         = var.ip_interface_configname
}
module "nsg" {
  source                          = ".//modules/nsg"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  bastion_count_value             = var.bastion_count_value
  env_name                        = var.env_name
  Asset_id                        = var.Asset_id
  privacy_level                   = var.privacy_level
  dept_name                       = var.dept_name
  network_interface_id            = module.bastion.nic_id
  nsg_name                        = var.nsg_name
  security_rules                  = var.security_rules
}
/*module "storage" {
  source                    = ".//modules/storage"
  location                  = var.location
  resource_group_name       = var.resource_group_name
} */