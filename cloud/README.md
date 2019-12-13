# Azure

- Azure Activy Directory 
- Subscription
- Resource Group
- Resources
  - Automation Account
  - Storage Account
  - Budget

## Install
```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

## Configure
- https://microsoft.github.io/AzureTipsAndTricks/blog/tip8.html
- Use table mode
```
az configure
```

## Show account

```bash
└─▪ az account show

# environmentName: AzureCloud
# id: 7777777-7777-7772-9d6e-611cf0165713
# isDefault: true
# name: Pago pelo Uso
# state: Enabled
# tenantId: 6ba38a6f-6b02-494b-a933-1000020c0aad
# user:
  # name: brunocampos01@gmail.com.br
  # type: user
```

```
az account list

# A few accounts are skipped as they don't have 'Enabled' state. Use '--all' to display them.
# Name             CloudName    SubscriptionId                        State    IsDefault
# ---------------  -----------  ------------------------------------  -------  -----------
# Pago pelo Uso    AzureCloud   7934f236-35c8-44e2-9d6e-611cf0165713  Enabled  True
# Microsoft Azure  AzureCloud   8f2dd591-253b-4c1b-8a2e-1ada03a16f2f  Enabled  False

```
