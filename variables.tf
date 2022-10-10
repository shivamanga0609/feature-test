#--------
# LOCALS
#--------

variable "Owner" {}

variable "Reason" {}

variable "Environment" {}

variable "location_short" {}

#-----------
# PROVIDERS
#-----------

variable "subscription_id" {}

variable "tenant_id" {}

variable "client_id" {}

variable "client_secret" {}

#----------------
# RESOURCE GROUP
#----------------

variable "resource_group_name" {}

variable "location" {}

#-----------------
# STORAGE ACCOUNT
#-----------------

variable "blob_storage_account_name" {}

variable "blob_storage_account_tier" {}

variable "blob_storage_account_replication_type" {}

variable "blob_storage_account_kind" {}

variable "blob_storage_account_is_hns_enabled" {}

#----------------
# BLOB CONTAINER
#----------------

variable "blob_storage_container_name" {}

variable "blob_storage_container_access_type" {}
