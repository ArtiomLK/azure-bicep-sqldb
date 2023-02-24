targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
param location string

@description('Az Resources tags')
param tags object = {}

// ------------------------------------------------------------------------------------------------
// SQL Database Configuration parameters
// ------------------------------------------------------------------------------------------------
@description('Sql Dabatase Name')
@minLength(1)
@maxLength(128)
param sqldb_n string

@description('Sql Server Name')
@minLength(1)
@maxLength(63)
param sql_n string

resource sqldb 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: '${sql_n}/${sqldb_n}'
  location: location
  tags: tags
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    sampleName: 'AdventureWorksLT'
  }
}

output id string = sqldb.id
