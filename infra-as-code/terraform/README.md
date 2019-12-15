# Terraform 


## Start service
O comando terraform init inicializa o diretório de trabalho.
```
terraform init
```

### Validate
```
terraform plan --out plan.out
```

### Running Script
Open directory with contains terraform file `<script>.tf`

```
terraform apply plan.out
``` 


## Storage State
https://docs.microsoft.com/pt-br/azure/terraform/terraform-backend
