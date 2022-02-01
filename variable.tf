variable "location" {
  type        = list(string)
  description = "Azure Region where all these resources will be provisioned"
}
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "cluster_name" {
  description = "multiple cluster names"
  type        = string
}
variable "count_value" {
  type = number
}
variable "private_dns_name" {
  type = string
}
variable "tags" {
  type        = map(string)
  default     = {}
}
variable "dns_prefix_name" {
  type = string
}
variable "node_pool_name" {
  type = string
}
/*variable "nodecount" {
  type = number
  #  default = 2
}*/
variable "vmsize" {
  type = string
}
variable "max_count" {
  type = number
}
variable "min_count" {
  type = number
}
variable "bationloc" {
  type        = string
  description = "Azure Region where all these resources will be provisioned"
}
variable "disk_size" {
  type = number
}
variable "type" {
  type = string
}
variable "loadbalancer_sku" {
  type = string
}

variable "networkplug" {
  type = string
}
variable "networkpolicy" {
  type = string
}
variable "service_principal_clientid" {
  type = string
  sensitive = true
}
variable "service_principal_clientsecret" {
  type = string
  sensitive = true
}
variable "docker_bridge" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "dns_service" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "service_cid" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "vnet_name" {
  type = string
}
variable "lvm_size" {
  type = string
}
variable "lvm_name" {
  type = string
}
variable "bastion_admin_user" {
  description = "usrs"
  type        = string
  sensitive   = true
}
variable "bastion_admin_passwd" {
  description = "value"
  type        = string
  sensitive   = true
}
variable "ddos_name" {
  type = string
}
variable "subnet_name" {
  type = list(string)
}
variable "bastion_vnet_name" {
  type = string
}
variable "bastion_subnet_name" {
  type = string
}
variable "bastionservice_subnet_name" {
  type = string
}
variable "cluster_bastion_peering" {
  type =  list(string)
}
variable "bastion_cluster_peering" {
  type =  list(string)
}
variable "cache" {
  type = string
}
variable "storage_type" {
  type = string
}
variable "publish_type" {
  type = string
}
variable "offer_type" {
  type = string
}
variable "sku_type" {
  type = string
}
variable "public_sku_type" {
  type = string
}
variable "version_type" {
  type = string
}
variable "public_ip_name" {
  type = string
}
variable "allocation_meth" {
  type = string
}
variable "bastion_host_name" {
  type = string
}
variable "ip_config_name" {
  type = string
}
variable "bastion_nic_name" {
  type = string
}
variable "ip_interface_configname" {
  type = string
}
variable "ip_allocation" {
  type = string
}
variable "cluster_vnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "cluster_subnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "bastion_vnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "bastion_subnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "cluster_vnet_peering" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "bastionservice_subnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
/*variable "firewall_subnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}*/
variable "security_rules" {
  description = "NSG Security rules"
  type        = list(map(string))
  #default     = null
}
variable "nsg_name" {
  type        = string
}
variable reverse_cluster_peering{
  type  = list(string)
}
variable "bastion_peering"{
  type  = list(string)
}
/*variable "prentdns_name" {
    type = list(string)
}
variable "clusvpc" {
  type = list(string)
}
variable "vnet_cluster_dns_name" {
    type = string
}*/
variable "bastion_count_value" {
    type = number
}
variable "vnet_cluster_revers_dns" {
    type = string
}
variable "private_dns_bastion" {
    type = string
}
variable "private_dnsregion_name" {
    type = string
}
variable "fw_name" {
  type = string
}
variable "network_rule_name"{
  description = "firewall ip config name"
  type        = string
}
/*variable "vnet_dns_name" {
    type = string
}
variable "bastion2_dns_name" {
    type = string
}
variable "vnet2_dns_name" {
    type = string
}
/*variable "fw_subnet" {
  type = list(string)
}*/
variable "env_name" {
  type = string
}
variable "Asset_id" {
  type = string
}
variable "privacy_level" {
  type = string
}
variable "dept_name" {
  type = string
}
variable "fw_ip_config_name"{
  description = "firewall ip config name"
  type        = string
}
variable "priority_value" {
type = number
}
variable "action_type"{
  description = "firewall action type"
  type        = string
}
variable "rule_description"{
  description = "firewall rule description"
  type        = string
}
variable "rule_name"{
  description = "firewall rule name"
  type        = string
}
variable "firewall_rule_source_addresses" {
  description = "destination addresses for firewall"
  type        = list(string)
}
variable "firewall_rule_destination_ports" {
  description = "destination ports for firewall"
  type        = list(string)
}
variable "firewall_protocols_type" {
  description = "firewall porocols "
  type        = list(string)
}
variable "fw_pub_ip" {
  description = "Firewal name"
  type        = string
}
variable "fw_pub_allocation_method" {
  description = "pubic ip allocation method"
  type        = string
}
variable "fw_pub_sku" {
  description = "pubic ip sku"
  type        = string
}

/*variable "storage_account_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "storage_container_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "account_tier" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "replication_type" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "containeraccess_type" {
  type        = string
  description = "This variable defines the Resource Group"
}*/