# Terraform 


## Start service
```
provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
        name = "testResourceGroup"
        location = "westus"
}
```

### Running Scipt
Open directory with contains terraform file `<script>.tf`

```
terraform apply
```
