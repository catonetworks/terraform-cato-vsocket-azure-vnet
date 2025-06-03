locals {
  effective_rg_name = var.resource_group_name == null ? azurerm_resource_group.azure-rg[0].name : var.resource_group_name
}
