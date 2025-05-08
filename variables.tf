## Cato Provider Variables

## VNET Variables
variable "subnet_range_mgmt" {
  type        = string
  description = <<EOT
    Choose a range within the VPC to use as the Management subnet. This subnet will be used initially to access the public internet and register your vSocket to the Cato Cloud.
    The minimum subnet length to support High Availability is /28.
    The accepted input format is Standard CIDR Notation, e.g. X.X.X.X/X
	EOT
}

variable "subnet_range_wan" {
  type        = string
  description = <<EOT
    Choose a range within the VPC to use as the Public/WAN subnet. This subnet will be used to access the public internet and securely tunnel to the Cato Cloud.
    The minimum subnet length to support High Availability is /28.
    The accepted input format is Standard CIDR Notation, e.g. X.X.X.X/X
	EOT
}

variable "subnet_range_lan" {
  type        = string
  description = <<EOT
    Choose a range within the VPC to use as the Private/LAN subnet. This subnet will host the target LAN interface of the vSocket so resources in the VPC (or AWS Region) can route to the Cato Cloud.
    The minimum subnet length to support High Availability is /29.
    The accepted input format is Standard CIDR Notation, e.g. X.X.X.X/X
	EOT
}

variable "vnet_prefix" {
  type        = string
  description = <<EOT
  	Choose a unique range for your new VPC that does not conflict with the rest of your Wide Area Network.
    The accepted input format is Standard CIDR Notation, e.g. X.X.X.X/X
	EOT
}

variable "dns_servers" {
  type = list(string)
  default = [
    "10.254.254.1",  # Cato Cloud DNS
    "168.63.129.16", # Azure DNS
    "1.1.1.1",
    "8.8.8.8"
  ]
}

## vSocket Varibables
variable "site_name" {
  type        = string
  description = "Your Cato Site Name Here"
  default     = null
}

variable "site_description" {
  type        = string
  description = "Site description"
}

variable "site_type" {
  description = "The type of the site"
  type        = string
  default     = "DATACENTER"
  validation {
    condition     = contains(["DATACENTER", "BRANCH", "CLOUD_DC", "HEADQUARTERS"], var.site_type)
    error_message = "The site_type variable must be one of 'DATACENTER','BRANCH','CLOUD_DC','HEADQUARTERS'."
  }
}

variable "site_location" {
  type = object({
    city         = string
    country_code = string
    state_code   = string
    timezone     = string
  })
}

variable "vm_size" {
  type        = string
  description = "(Required) Specifies the size of the Virtual Machine. See also Azure VM Naming Conventions. https://learn.microsoft.com/en-us/azure/virtual-machines/vm-naming-conventions"
  default     = "Standard_D8ls_v5"
}

variable "disk_size_gb" {
  type        = number
  description = "Disk size in GB"
  default     = 8
  validation {
    condition     = var.disk_size_gb > 0
    error_message = "Disk size must be greater than 0"
  }
}

variable "lan_ip" {
  type        = string
  description = "Local IP Address of socket LAN interface"
  default     = null
}

## Vsocket Params
variable "az_location" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  default     = null
}

variable "image_reference_id" {
  type        = string
  description = "Path to image used to deploy specific version of the virutal socket"
  default     = "/Subscriptions/38b5ec1d-b3b6-4f50-a34e-f04a67121955/Providers/Microsoft.Compute/Locations/eastus/Publishers/catonetworks/ArtifactTypes/VMImage/Offers/cato_socket/Skus/public-cato-socket/Versions/19.0.17805"
}

variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  default     = null
}

variable "license_id" {
  description = "The license ID for the Cato vSocket of license type CATO_SITE, CATO_SSE_SITE, CATO_PB, CATO_PB_SSE.  Example License ID value: 'abcde123-abcd-1234-abcd-abcde1234567'.  Note that licenses are for commercial accounts, and not supported for trial accounts."
  type        = string
  default     = null
}

variable "license_bw" {
  description = "The license bandwidth number for the cato site, specifying bandwidth ONLY applies for pooled licenses.  For a standard site license that is not pooled, leave this value null. Must be a number greater than 0 and an increment of 10."
  type        = string
  default     = null
}