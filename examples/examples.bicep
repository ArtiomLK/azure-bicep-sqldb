targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------

// Sample tags parameters
var tags = {
  project: 'bicephub'
  env: 'dev'
}

param location string = 'eastus2'

var sqldb_n = 'sample-db'

// ------------------------------------------------------------------------------------------------
// REQUIREMENTS
// SQL Server
// ------------------------------------------------------------------------------------------------
@secure()
param SQL_ADMIN_LOGIN_N string
@secure()
param SQL_ADMIN_LOGIN_PASS string

var sql_n = 'sql-server-${uniqueString(resourceGroup().id)}'

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sql_n
  location: location
  tags: tags
  properties: {
    administratorLogin: SQL_ADMIN_LOGIN_N
    administratorLoginPassword: SQL_ADMIN_LOGIN_PASS
    version: '12.0'
  }
}

// ------------------------------------------------------------------------------------------------
// MAIN DEPLOYMENT
// SQL DBs
// ------------------------------------------------------------------------------------------------
module sqldb '../main.bicep' = {
  name: 'sql-basic'
  params: {
    location: location
    sql_n: sql_n
    sqldb_n: sqldb_n
    tags: tags
  }
  dependsOn: [
    sqlServer
  ]
}
