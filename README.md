# CATO VSOCKET Azure VNET Terraform module

Terraform module which creates a VNET in Azure, required subnets, network interfaces, security groups, route tables, an Azure Socket Site in the Cato Management Application (CMA), and deploys a virtual socket VM instance in Azure.

List of resources:
- azurerm_virtual_network (vnet)
- azurerm_availability_set (availability-set)
- azurerm_network_security_group (lan-sg)
- azurerm_network_security_group (mgmt-sg)
- azurerm_network_security_group (wan-sg)
- azurerm_network_interface (lan-nic)
- azurerm_network_interface (mgmt-nic)
- azurerm_network_interface (wan-nic)
- azurerm_network_interface_security_group_association (lan-nic-association)
- azurerm_network_interface_security_group_association (mgmt-nic-association)
- azurerm_network_interface_security_group_association (wan-nic-association)
- azurerm_public_ip (mgmt-public-ip)
- azurerm_public_ip (wan-public-ip)
- azurerm_resource_group (azure-rg)
- azurerm_route_table (private-rt)
- azurerm_route_table (public-rt)
- azurerm_route (lan-route)
- azurerm_route (public-rt)
- azurerm_route (route-internet)
- azurerm_subnet (subnet-lan)
- azurerm_subnet (subnet-mgmt)
- azurerm_subnet (subnet-wan)
- azurerm_subnet_route_table_association (rt-table-association-lan)
- azurerm_subnet_route_table_association (rt-table-association-mgmt)
- azurerm_subnet_route_table_association (rt-table-association-wan)
- azurerm_virtual_network_dns_servers (dns_servers)

## Usage

```hcl
module "vsocket-azure-vnet" {
  source              = "catonetworks/vsocket-azure-vnet/cato"
  token               = "xxxxxxx"
  account_id          = "xxxxxxx"
  vnet_prefix         = "10.3.0.0/16"
  subnet_range_mgmt   = "10.3.1.0/24"
  subnet_range_wan    = "10.3.2.0/24"
  subnet_range_lan    = "10.3.3.0/24"
  lan_ip              = "10.3.3.5"
  resource-group-name = var.resource_group_name
  site_name           = "Your-Cato-site-name-here"
  site_description    = "Your Cato site desc here"
  site_location = {
    city         = "San Diego"
    country_code = "US"
    state_code   = "US-CA" ## Optional - for countries with states
    timezone     = "America/Los_Angeles"
  }
}
```

## Site Location Reference

For more information on site_location syntax, use the [Cato CLI](https://github.com/catonetworks/cato-cli) to lookup values.

```bash
$ pip3 install catocli
$ export CATO_TOKEN="your-api-token-here"
$ export CATO_ACCOUNT_ID="your-account-id"
$ catocli query siteLocation -h
$ catocli query siteLocation '{"filters":[{"search": "San Diego","field":"city","operation":"exact"}]}' -p
```

## Authors

Module is maintained by [Cato Networks](https://github.com/catonetworks) with help from [these awesome contributors](https://github.com/catonetworks/terraform-cato-vsocket-azure-vnet/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/catonetworks/terraform-cato-vsocket-azure-vnet/tree/master/LICENSE) for full details.

