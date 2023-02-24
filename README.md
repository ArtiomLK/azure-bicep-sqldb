# Azure SQL Database

[![DEV - Deploy Azure Resource](https://github.com/ArtiomLK/azure-bicep-sqldb/actions/workflows/dev.orchestrator.yml/badge.svg?branch=main&event=push)](https://github.com/ArtiomLK/azure-bicep-sqldb/actions/workflows/dev.orchestrator.yml)

[Reference examples][1]

## Locally test Azure Bicep Modules

```bash
sub_id="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";        echo $sub_id
rg_n="rg-azure-bicep-sqldb-demo";                     echo $rg_n
l="eastus2";                                          echo $l

# Create an Azure Resource Group
az group create \
--name $rg_n \
--location $l \
--tags project=bicephub env=dev

# Deploy Sample Modules
az deployment group create \
--subscription $sub_id \
--resource-group $rg_n \
--mode Incremental \
--template-file examples/examples.bicep
```

[1]: ./examples/examples.bicep
