# Terraform 


## Start service
O comando terraform init inicializa o diretório.
```
terraform init
```

### Validate
```
terraform plan --out plan.tf
```

### Running Script
Open directory with contains terraform file `<script>.tf`

```
terraform apply plan.out
``` 

## Structure Files
```
├── layers
│   ├── company-dev
│   │   ├── application
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   ├── global
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
```

## Variables

Using Input Variable Values
Within the module that declared a variable, its value can be accessed from within expressions as var.<NAME>, where <NAME> matches the label given in the declaration block:
```
resource "aws_instance" "example" {
istance_type = "t2.micro"
ami           = var.image_id
}
```
## Storage State
https://docs.microsoft.com/pt-br/azure/terraform/terraform-backend
