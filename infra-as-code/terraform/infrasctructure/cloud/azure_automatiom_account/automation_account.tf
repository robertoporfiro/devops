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

resource "azurerm_automation_account" "automation_account" {
    name                        = "${var.product_client_name_lower}-autoacc"
    location                    = "${var.location}"
    resource_group_name         = "${azurerm_resource_group.rg.name}"
    sku_name                    = "Basic"
    tags                        = "${var.tags}"
}

resource "azurerm_automation_credential" "automation_credential" {
    name                    = "application_user"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    username                = "${var.application_user_login}"
    password                = "${var.application_user_password}"
}

resource "azurerm_automation_module" "azurerm_profile" {
    name                    = "AzureRM.Profile"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"

    module_link {
        uri = "https://www.powershellgallery.com/api/v2/package/AzureRM.profile/5.8.3"
    }
}

resource "azurerm_automation_module" "azurerm_analysisservices" {
    name                    = "AzureRM.AnalysisServices"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"

    module_link {
        uri = "https://www.powershellgallery.com/api/v2/package/AzureRM.AnalysisServices/0.6.14"
    }
    depends_on = [
        "azurerm_automation_module.azurerm_profile"
    ]
}

resource "azurerm_automation_module" "sqlserver" {
    name                    = "SqlServer"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"

    module_link {
        uri = "https://www.powershellgallery.com/api/v2/package/SqlServer/21.1.18206"
    }
    depends_on = [
        "azurerm_automation_module.azurerm_analysisservices"
    ]
}

resource "azurerm_automation_module" "azurerm_sql" {
    name                    = "AzureRM.Sql"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"

    module_link {
        uri = "https://www.powershellgallery.com/api/v2/package/AzureRM.Sql/4.12.1"
    }
    depends_on = [
        "azurerm_automation_module.sqlserver"
    ]
}

#******************************************************************************
# Runbooks
#******************************************************************************
data "local_file" "file_start_stop_as_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-start-stop-as-runbook.ps1"
}

resource "azurerm_automation_runbook" "start_stop_as_runbook" {
    name                     = "${var.product_client_name_lower}-start-stop-as-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Stat and stop Analysis Services"
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.file_start_stop_as_runbook.content}"
}

data "local_file" "file_apply_roles_as_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-apply-roles-as-runbook.ps1"
}

resource "azurerm_automation_runbook" "apply_roles_as_runbook" {
    name                     = "${var.product_client_name_lower}-apply-roles-as-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Apply roles in Model Database"
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.file_apply_roles_as_runbook.content}"
}

data "local_file" "file_restore_bkp_as_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-restore-bkp-as-runbook.ps1"
}

resource "azurerm_automation_runbook" "restore_bkp_as_runbook" {
    name                     = "${var.product_client_name_lower}-restore-bkp-as-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Restore backup analysis services"
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.file_restore_bkp_as_runbook.content}"
}

data "local_file" "file_send_email_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-send-email-runbook.ps1"
}

resource "azurerm_automation_runbook" "send_email_runbook" {
    name                     = "${var.product_client_name_lower}-send-email-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Stat and stop anlysis services"
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.file_send_email_runbook.content}"
}


data "local_file" "file_update_partitions_as_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-update-partitions-as-runbook.ps1"
}

resource "azurerm_automation_runbook" "update_partitions_as_runbook" {
    name                     = "${var.product_client_name_lower}-update-partitions-as-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Update partitions in Analysis Services."
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.file_update_partitions_as_runbook.content}"
}


data "local_file" "update_bkp_as_runbook" {
    filename = "${path.module}/${var.product_client_name_lower}-update-bkp-as-runbook.ps1"
}

resource "azurerm_automation_runbook" "update_bkp_as_runbook" {
    name                     = "${var.product_client_name_lower}-update-bkp-as-runbook"
    location                 = "${var.location}"
    resource_group_name      = "${azurerm_resource_group.rg.name}"
    account_name             = "${azurerm_automation_account.automation_account.name}"
    log_verbose              = "true"
    log_progress             = "true"
    description              = "Update backup file of Analysis Services"
    runbook_type             = "PowerShell"
    tags                     = "${var.tags}"

    publish_content_link {
        uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
    }

    content = "${data.local_file.update_bkp_as_runbook.content}"
}

#******************************************************************************
# Schedules
#******************************************************************************
resource "azurerm_automation_schedule" "start_as" {
    name                    = "start-as-schedule"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    description             = "Start service Analysis Services"
    frequency               = "Day"
    timezone                = "E. South America Standard Time"
    start_time              = "2019-12-27T11:00:00+00:00"
}

resource "azurerm_automation_schedule" "stop_as" {
    name                    = "stop-as-schedule"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    description             = "Stop service Analysis Services"
    frequency               = "Day"
    timezone                = "E. South America Standard Time"
    start_time              = "2019-12-27T20:00:00+00:00"
}

resource "azurerm_automation_schedule" "stop_again_as" {
    name                    = "stop-again-as-schedule"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    description             = "Stop, if services continue running"
    frequency               = "Day"
    timezone                = "E. South America Standard Time"
    start_time              = "2019-12-27T01:55:00+00:00"
}

resource "azurerm_automation_schedule" "update_partitions_as" {
    name                    = "update-partitions-as-schedule"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    description             = "Update Analysis Services"
    frequency               = "Day"
    timezone                = "E. South America Standard Time"
    start_time              = "2019-12-27T11:10:00+00:00"
}

resource "azurerm_automation_schedule" "update_backup_as" {
    name                    = "update-backup-as-schedule"
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    description             = "Update bkp Azure Analysis Services"
    frequency               = "Day"
    timezone                = "E. South America Standard Time"
    start_time              = "2019-12-27T11:05:00+00:00"
}

#******************************************************************************
# Runbooks + Schedules
#*****************************************************************************
resource "azurerm_automation_job_schedule" "azurerm_automation_job_schedule_start_as" {
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    runbook_name            = "${azurerm_automation_runbook.start_stop_as_runbook.name}"
    schedule_name           = "${azurerm_automation_schedule.start_as.name}"
}

resource "azurerm_automation_job_schedule" "azurerm_automation_job_schedule_stop_as" {
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    runbook_name            = "${azurerm_automation_runbook.start_stop_as_runbook.name}"
    schedule_name           = "${azurerm_automation_schedule.stop_as.name}"
}

resource "azurerm_automation_job_schedule" "azurerm_automation_job_schedule_stop_again_as" {
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    runbook_name            = "${azurerm_automation_runbook.start_stop_as_runbook.name}"
    schedule_name           = "${azurerm_automation_schedule.stop_again_as.name}"
}

resource "azurerm_automation_job_schedule" "azurerm_automation_job_schedule_update_partitions_sas" {
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    runbook_name            = "${azurerm_automation_runbook.start_stop_as_runbook.name}"
    schedule_name           = "${azurerm_automation_schedule.update_partitions_as.name}"
}

resource "azurerm_automation_job_schedule" "azurerm_automation_job_schedule_update_backup_as" {
    resource_group_name     = "${azurerm_resource_group.rg.name}"
    automation_account_name = "${azurerm_automation_account.automation_account.name}"
    runbook_name            = "${azurerm_automation_runbook.start_stop_as_runbook.name}"
    schedule_name           = "${azurerm_automation_schedule.update_backup_as.name}"
}
