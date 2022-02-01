resource "azurerm_network_interface" "bastion_nic" {
  count                     = var.bastion_count_value
  name                      = "${format("%s-dca",(var.bastion_nic_name))}"
  location                  = element(var.location,count.index)
  resource_group_name       = var.resource_group_name
  ip_configuration {
    name                          = var.ip_interface_configname
    subnet_id                     = var.nic_subnet_id
    private_ip_address_allocation = var.ip_allocation
  }
  #tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", element(var.bastion_nic_name,count.index)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                           = var.bastion_count_value
  name                            = format("${var.lvm_name}-%02d-dca", count.index + 1)
  location                        = element(var.location,count.index)
  resource_group_name             = var.resource_group_name
  size                            = var.lvm_size
  admin_username                  = var.bastion_admin_user
  admin_password                  = var.bastion_admin_passwd
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.bastion_nic[count.index].id,
  ]

  os_disk {
    caching                      = var.cache
    storage_account_type         = var.storage_type
  }

  source_image_reference {
    publisher                   = var.publish_type
    offer                       = var.offer_type
    sku                         = var.sku_type
    version                     = var.version_type
  }
  #tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", format("${var.lvm_name}-%02d-dca", count.index + 1)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}
resource "azurerm_public_ip" "pip_azure_bastion" {
  count                        = var.bastion_count_value
  name                         = "${format("%s-dca",(var.public_ip_name))}"
  location                     = element(var.location,count.index)
  resource_group_name          = var.resource_group_name
  allocation_method            = var.allocation_meth
  sku                          = var.public_sku_type
  #tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", element(var.public_ip_name,count.index)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}
resource "azurerm_bastion_host" "azure-bastion" {
  count                       = var.bastion_count_value
  name                        = "${format("%s-dca",(var.bastion_host_name))}"
  location                    = element(var.location,count.index)
  resource_group_name         = var.resource_group_name
  ip_configuration {
    name                      = var.ip_config_name
    subnet_id                 = var.bastion_subnet_id 
    public_ip_address_id      = azurerm_public_ip.pip_azure_bastion[count.index].id
  }
 #tags = merge({ "env"=var.env_name,"Name" = format("%s-dca", element(var.bastion_host_name,count.index)),"Asset"=var.Asset_id,"privacy-level"=var.privacy_level,"dept"=var.dept_name}, var.tags, )
}