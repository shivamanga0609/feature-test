variable resource_group_name {
  default            = "dev-terraform-rg"
  description        = "Name of the resource group"
}
variable resource_group_location {
  default            = "East US"
  description        = "Location of the resource group"
}
variable virtual_network_name {
    default          = "dev-terraform-vnet"
    description      = "Name of the vnet"
}
variable subnet_name {
    default          = "dev--terraform-subnet"
    description      = "Name of the subnet"
}
variable network_interface_name {
    default          = "dev-terraform-nic"
    description      = "Name of the NIC"
}
variable network_security_group_name {
    default          = "dev-terraform-nsg" 
    description      = "Name of the NSG"
}
variable virtual_machine_name {
    default          = "dev-terraform-vm"
    description      = "Name of the VM"
}
variable storage_account_name {
    default          = "devstorageaccount"
    description      = "Name of the storage account"
}
