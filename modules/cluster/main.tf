# Create the AKS Cluster
resource "azurerm_kubernetes_cluster" "my_aks" {
  count                   = var.count_value
  name                    = format("${var.cluster_name}-%02d-dca", count.index + 1)
  location                = element(var.location,count.index)
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix_name
  private_cluster_enabled = true
  role_based_access_control {
    enabled = true
  }
  addon_profile {

    kube_dashboard {
      enabled = false
    }
  }

  network_profile {
    load_balancer_sku   =  var.loadbalancer_sku
    network_plugin      = var.networkplug
    docker_bridge_cidr  = element(var.docker_bridge,count.index)
    dns_service_ip      = element(var.dns_service,count.index)
    service_cidr        = element(var.service_cid,count.index)
    network_policy      = var.networkpolicy
  }
  default_node_pool {
    name                = var.node_pool_name
    //node_count         = var.nodecount
    vm_size             = var.vmsize
    vnet_subnet_id      = element(var.addrees_prefixes,count.index)
    availability_zones  = [ 1,2,3 ]
    enable_auto_scaling = true
    max_count           = var.max_count
    min_count           = var.min_count
    os_disk_size_gb     = var.disk_size
    type                =  var.type
  }
  service_principal {
    client_id           = var.service_principal_clientid
    client_secret       = var.service_principal_clientsecret
  }
 tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", format("${var.cluster_name}%02d", count.index + 1)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
  
}
resource "azurerm_private_dns_zone_virtual_network_link" "link_bastion" { 
  name                  = format("${ var.private_dns_name}-%02d-dca", count.index + 1)
  count                 = var.count_value
  private_dns_zone_name = join(".", slice(split(".", azurerm_kubernetes_cluster.my_aks[count.index].private_fqdn), 1, length(split(".", azurerm_kubernetes_cluster.my_aks[count.index].private_fqdn))))
  resource_group_name   = "MC_${var.resource_group_name}_${format("${var.cluster_name}-%02d-dca", count.index + 1)}_${element(var.location,count.index)}"
  virtual_network_id    = element(var.address_space,count.index)
  tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", format("${ var.private_dns_name}-%02d-dca", count.index + 1)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
} 
resource "azurerm_private_dns_zone_virtual_network_link" "vnet_bastion_reverse" { 
  name                  = format("${ var.vnet_cluster_revers_dns}-%02d-dca", count.index + 1)
  count                 = var.count_value
  private_dns_zone_name = join(".", slice(split(".", azurerm_kubernetes_cluster.my_aks[count.index].private_fqdn), 1, length(split(".", azurerm_kubernetes_cluster.my_aks[count.index].private_fqdn))))
  resource_group_name   = "MC_${var.resource_group_name}_${format("${var.cluster_name}-%02d-dca", count.index + 1)}_${element(var.location,count.index)}"
  virtual_network_id    = element(var.vnet_cluster_space,1-count.index)
}


