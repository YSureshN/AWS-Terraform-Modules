resource "azurerm_network_ddos_protection_plan" "ddos" {
  count                    = var.count_value
  name                     = format("${var.ddos_name}-%02d-dca", count.index + 1)
  location                 = element(var.location,count.index)
  resource_group_name      = var.resource_group_name
 tags = merge({ "env"=var.env_name,"Name" = format("%s-dca",format("${var.ddos_name}-%02d-dca", count.index + 1) ),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}