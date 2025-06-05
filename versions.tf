terraform {
  required_providers {
    cato = {
      source = "catonetworks/cato"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.31.0"
    }
  }
  required_version = ">= 0.13"
}
