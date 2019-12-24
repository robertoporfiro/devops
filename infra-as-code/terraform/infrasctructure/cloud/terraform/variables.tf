#Variables declaration
variable "subscription_id" {
    description = "Azure subscription Id."
    type = "string"
    default = "8f2dd591-253b-4c1b-8a2e-1ada03a16f2f"
}

variable "client_id" {
    description = "Azure service principal application Id"
    type = "string"
    default = "9562d324-3e18-4f4b-8552-e32829652024"
}

variable "client_secret" {
    description = "Azure service principal application Secret"
    type = "string"
    default = "88b06b76-af2b-42a3-9606-4ebc70032321"
}

variable "tenant_id" {
    description = "Azure tenant Id."
    type = "string"
    default = "6ba38a6f-6b02-494b-a933-1000020c0aad"
}

variable "location" {
    type = "string"
    default = "central us"
}

variable "client_name" {
    type = "string"
    default = "mpms"
}

variable "product_client_name" {
    type = "string"
    default = "SAJinsights-mpms"
}

variable "tags" {
    type = "map"
    default = {
        vaticano-analytics = "bi"
        sajinsights = "mpms"
    }
}

variable "admin_users" {
    type = "list"
    default = [
        "bruno.moura@sajinsights.com.br",
        "amanda.paula@sajinsights.com.br",
        "gatewaypbi@sajinsights.com.br",
        "marcelo.eugenio@sajinsights.com.br"]
}

variable "product_client_name_lower" {
    type = "string"
    default = "sajinsights-mpms"
}
