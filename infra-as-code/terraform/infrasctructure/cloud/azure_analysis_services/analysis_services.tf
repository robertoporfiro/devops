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

resource "azurerm_analysis_services_server" "analysis_services_server" {
    name                        = "sajinsights${var.client_name}"
    location                    = "${var.location}"
    resource_group_name         = "${azurerm_resource_group.rg.name}"
    sku                         = "S0"
    admin_users                 = "${var.admin_users}"
    enable_power_bi_service     = true
    backup_blob_container_uri   = "https://sajinsights${var.client_name}.blob.core.windows.net/analysis-services-container"
    tags                        = "${var.tags}"
}
