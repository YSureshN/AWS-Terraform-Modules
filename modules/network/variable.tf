variable "location" {
  type        = list(string)
  description = "Azure Region where all these resources will be provisioned"
}
variable "bationloc" {
  type        = string
  description = "Azure Region where all these resources will be provisioned"
}
variable "ddos_id" {
  
}
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "vnet_name" {
    type = string
}
variable "reverse_cluster_peering"{
  type  = list(string)
}
variable "bastion_peering"{
  type  = list(string)
}
variable "bastion_vnet_name" {
    type = string
}
variable "cluster_bastion_peering" {
    type =  list(string)
}
variable "bastion_cluster_peering" {
    type =  list(string)
}
variable "tags" {
   type        = map(string)
  default     = {}
}
variable "count_value" {
    type = number
}
variable "cluster_vnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "bastion_vnet" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
} 
variable "bastion_count_value" {
    type = number
}
variable "cluster_vnet_peering" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
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