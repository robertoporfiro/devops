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

## Storage State
https://docs.microsoft.com/pt-br/azure/terraform/terraform-backend
