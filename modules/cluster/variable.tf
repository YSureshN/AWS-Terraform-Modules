variable "location" {
  type        = list(string)
  description = "Azure Region where all these resources will be provisioned"
}
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "cluster_name" {
  type = string
}
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
variable "count_value" {
    type = number
}
variable "private_dns_name" {
    type = string
}

variable "private_dnsregion_name" {
    type = string
}
variable "private_dns_bastion" {
    type = string
}//vnet_cluster_revers_dns
variable "vnet_cluster_revers_dns" {
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
variable "loadbalancer_sku" { 
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
/*variable "nodecount" {
    type = number
} */
variable "vmsize" {
    type = string
   
}
variable "max_count" {
  type = number
 
}
variable "min_count" {
  type = number
} 
variable "disk_size" {
  type = number
 
}
variable "type" {
  type = string
 
}
variable "networkplug" {
  type = string
 
}
variable "networkpolicy" {
    type =  string
}
variable "addrees_prefixes" {
  type = list(string)
}
variable "address_space" {
  type = list(string)
}
variable "vnet_cluster_space" {
  type = list(string)
}
variable "vnet_dns_id" {
  type = list(string)
}
variable "docker_bridge" {
  description = "The address prefix to use for the subnet."
   type = list(string)
 }
variable "dns_service" {
  description = "The address prefix to use for the subnet."
   type = list(string)
}
variable "service_cid" {
  description = "The address prefix to use for the subnet."
   type = list(string)
}
