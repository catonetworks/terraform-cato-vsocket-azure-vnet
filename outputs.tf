##The following attributes are exported:

output "azurerm_virtual_network_id" { value = azurerm_virtual_network.vnet.id }
output "azurerm_availability_set" { value = azurerm_availability_set.availability-set.id }
output "lan_sg_id" { value = azurerm_network_security_group.lan-sg.id }
output "mgmt_sg_id" { value = azurerm_network_security_group.mgmt-sg.id }
output "wan_sg_id" { value = azurerm_network_security_group.wan-sg.id }
output "lan_nic_id" { value = azurerm_network_interface.lan-nic.id }
output "mgmt_nic_id" { value = azurerm_network_interface.mgmt-nic.id }
output "wan_nic_id" { value = azurerm_network_interface.wan-nic.id }
output "lan_nic_association_id" { value = azurerm_network_interface_security_group_association.lan-nic-association.id }
output "mgmt_nic_association_id" { value = azurerm_network_interface_security_group_association.mgmt-nic-association.id }
output "wan_nic_association_id" { value = azurerm_network_interface_security_group_association.wan-nic-association.id }
output "mgmt_public_ip_id" { value = azurerm_public_ip.mgmt-public-ip.id }
output "wan_public_ip_id" { value = azurerm_public_ip.wan-public-ip.id }
output "resource_group_name" { value = var.resource_group_name == null ? azurerm_resource_group.azure-rg[0].name : var.resource_group_name }
output "private_rt_id" { value = azurerm_route_table.private-rt.id }
output "public_rt_id" { value = azurerm_route_table.public-rt.id }
output "lan_route_id" { value = azurerm_route.lan-route.id }
output "public_route_id" { value = azurerm_route.public-rt.id }
output "azurerm_route_id" { value = azurerm_route.route-internet.id }
output "lan_subnet_id" { value = azurerm_subnet.subnet-lan.id }
output "mgmt_subnet_id" { value = azurerm_subnet.subnet-mgmt.id }
output "wan_subnet_id" { value = azurerm_subnet.subnet-wan.id }
output "lan_rt_association_id" { value = azurerm_subnet_route_table_association.rt-table-association-lan.id }
output "mgmt_rt_association_id" { value = azurerm_subnet_route_table_association.rt-table-association-mgmt.id }
output "wan_rt_association_id" { value = azurerm_subnet_route_table_association.rt-table-association-wan.id }
output "dns_servers_id" { value = azurerm_virtual_network_dns_servers.dns_servers.id }
output "socket_site_id" { value = module.vsocket-azure.socket_site_id }
output "socket_site_serial" { value = module.vsocket-azure.socket_site_serial }
output "cato_license_site" { value = var.license_id == null ? null : module.vsocket-azure.cato_license }