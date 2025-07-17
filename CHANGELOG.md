# Changelog

## 0.0.1 (2024-11-12)

### Features
- Initial commit with single socket instance with 3 NICs creating vull vnet
- Added default vales for required parameters

## 0.0.2 (2024-11-15)

### Features
- Updated names of outputs

## 0.0.3 (2025-05-07)

### Features
- Removed nested azure provider, and made creation of resource group optional
- Added optional license resource and inputs used for commercial site deployments

## 0.0.4 (2025-06-03)

### Features
- Adjusted items sent to vSocket Module due to Module Changes 
  - nic_id becomes nic_name
  - resource group becomes conditional based on whether information is passed 
- Bumped AzureRM Provider Version to 4.31 from 4.1 
- Added Tags Arguement (Optional)
- Updated Depends_On for vSocket Module Call
- Updated az_location to be required
- Requires Module Version 0.1.1 of vSocket Module
- Added Security Rules to the LAN, MGMT, and WAN Security Groups 
- Moved ResourceGroup name manipulation to Locals to Clean up Code 
- Changed default Site Type to CLOUD_DC
- Updated Example in README to include required Variables

## 0.0.5 (2025-06-06)

### Features
- Adjusted Module Call

## 0.0.6 (2025-07-17)

### Features 
- Update Module to dynamically resolve SiteLocation from Azure Location / Region 
- Version locked Cato provider to v0.0.30 or Greater 
- Version locked Terraform to v1.5 or Greater 

## 0.0.7 (2025-07-17)

### Features 
 - fix malformed site_location.tf