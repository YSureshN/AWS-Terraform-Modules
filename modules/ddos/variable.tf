variable "location" {
  type        = list(string)
  description = "Azure Region where all these resources will be provisioned"
}
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
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
variable "ddos_name" {
    type = string 
}
variable "count_value" {
    type = number
}
variable "tags" {
  type        = map(string)
  default     = {}
}