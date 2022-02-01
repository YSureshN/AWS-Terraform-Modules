# Create Vnet and subnet for the AKS cluster
resource "azurerm_virtual_network" "vnet_cluster" {
  count                    = var.count_value
  name                     = format("${var.vnet_name}-%02d-dca", count.index + 1)
  location                 = element(var.location,count.index)
  resource_group_name      = var.resource_group_name
  address_space            = [element(var.cluster_vnet,count.index)]
  ddos_protection_plan {
    id                     = element(var.ddos_id,count.index)
    enable                 = true
  } 
   tags = merge({ "env"=var.env_name,"Name"= format("%s-dca", format("${var.vnet_name}-%02d-dca", count.index + 1)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}
resource "azurerm_virtual_network" "vnet_bastion" {
  #count                  = var.bastion_count_value
  name                   = format("${var.bastion_vnet_name}-dca")
  location               = var.bationloc
  resource_group_name    = var.resource_group_name
  address_space          = var.bastion_vnet
  tags = merge({ "env"=var.env_name,"Name" = format("${var.bastion_vnet_name}-dca"),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags,)
}
resource "azurerm_virtual_network_peering" "peering_bastion_cluster" {
  count                     = var.count_value
  name                      = "${format("%s-dca",element(var.bastion_cluster_peering,count.index))}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_bastion.name//bastion 2 1reg 2reg
  remote_virtual_network_id = azurerm_virtual_network.vnet_cluster[count.index].id//bastion1 region perr cluster2 ,bastion2 cluster2
  allow_gateway_transit = false //`allow_gateway_transit` must be set to false for vnet Global Peering
}
resource "azurerm_virtual_network_peering" "peering_cluster_bastion" {
  count                     = var.count_value
  name                      = "${format("%s-dca",element(var.cluster_bastion_peering,count.index))}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_cluster[count.index].name
  remote_virtual_network_id = azurerm_virtual_network.vnet_bastion.id
  allow_gateway_transit = false //`allow_gateway_transit` must be set to false for vnet Global Peering
}

##this will peer cluster vnet1 to cluster vnet2 and cluster vnet2 to vnet1
resource "azurerm_virtual_network_peering" "peering_vnet_cluster" {
  count                     = var.count_value
  name                      = "${format("%s-dca",element(var.cluster_vnet_peering,count.index))}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = element(azurerm_virtual_network.vnet_cluster.*.name,count.index)
  remote_virtual_network_id = element(azurerm_virtual_network.vnet_cluster.*.id, 1 - count.index)
  allow_gateway_transit = false //`allow_gateway_transit` must be set to false for vnet Global Peering
} 