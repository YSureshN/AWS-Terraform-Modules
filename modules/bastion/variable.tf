variable "bastion_count_value" {
    type = number
}
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
}
variable "bastion_nic_name" {
  type        = string
}
variable "ip_interface_configname" {
  type        = string
}
variable "nic_subnet_id" {
  description = "The address prefix to use for the subnet."
  type        = string
}
variable "lvm_name" {
    type = string
}
variable "lvm_size" {
    type = string 
}
variable "bastion_admin_user" {
  description = "usrs"
  type = string
  sensitive   = true
}
variable "bastion_admin_passwd" {
  description = "value"
  type = string
  sensitive   = true
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
variable "tags" {
  type        = map(string)
  default     = {}
}
variable "location" {
  type        = list(string)
  description = "Azure Region where all these resources will be provisioned"
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
variable "version_type" {
    type = string
}
variable "public_ip_name" {
    type = string
}
variable "allocation_meth" {
    type = string
}
variable "public_sku_type" {
    type = string
}
variable "bastion_host_name" {
    type = string
}
variable "ip_config_name" {
    type = string
}
variable "bastion_subnet_id" {
   type = string
}
variable "ip_allocation" {
  type        = string
}