provider "azurerm" {
    version = ">= 1.38"
    subscription_id = "${var.subscription_id}"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
    tenant_id = "${var.tenant_id}"
}

resource "azurerm_resource_group" "rg" {
    name                        = "${var.product_client_name}-rg"
    location                    = "${var.location}"
    tags                        = "${var.tags}"
}

resource "azurerm_storage_account" "storage_account" {
    name                        = "sajinsights${var.client_name}"
    resource_group_name         = "${azurerm_resource_group.rg.name}"
    location                    = "${var.location}"
    account_replication_type    = "RAGRS"
    account_tier                = "Standard"
    access_tier                 = "Cool"
    account_kind                = "BlobStorage"
    tags                        = "${var.tags}"
}

#******************************************************************************
# Containers
#******************************************************************************
resource "azurerm_storage_container" "container_analysis_services" {
    name                  = "analysis-services-container"
    storage_account_name  = "${azurerm_storage_account.storage_account.name}"
    container_access_type = "container"
}

#******************************************************************************
# Files
#******************************************************************************
resource "azurerm_storage_blob" "role_admins" {
    name                   = "role_admins.json"
    storage_account_name   = "${azurerm_storage_account.storage_account.name}"
    storage_container_name = "${azurerm_storage_container.container_analysis_services.name}"
    access_tier            = "Hot"
    type                   = "Block"
    source                 = "${path.module}/role_admins.json"
    depends_on = [
        "azurerm_storage_container.container_analysis_services"
    ]
}

resource "azurerm_storage_blob" "role_readers" {
    name                   = "role_readers.json"
    storage_account_name   = "${azurerm_storage_account.storage_account.name}"
    storage_container_name = "${azurerm_storage_container.container_analysis_services.name}"
    access_tier            = "Hot"
    type                   = "Block"
    source                 = "${path.module}/role_readers.json"
    depends_on = [
        "azurerm_storage_container.container_analysis_services"
    ]
}

resource "azurerm_storage_blob" "update_mpms" {
    name                   = "update_mpms.json"
    storage_account_name   = "${azurerm_storage_account.storage_account.name}"
    storage_container_name = "${azurerm_storage_container.container_analysis_services.name}"
    access_tier            = "Hot"
    type                   = "Block"
    source                 = "${path.module}/update_database.json"
    depends_on = [
        "azurerm_storage_container.container_analysis_services"
    ]
}
