module "generate_files_storage_account" {
    source                      = "../scripts"
}

module "sajinsights_storage_account" {
    source                      = "../azure_storage_account"
}

module "sajinsights_automation_account" {
    source                      = "../azure_automatiom_account"
}

module "sajinsights_log_analytics" {
    source                      = "../azure_log_analytics"
}

module "sajinsights_analysis_services" {
    source                      = "../azure_analysis_services"
}
