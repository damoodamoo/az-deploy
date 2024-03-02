targetScope = 'subscription'

param environment string
param suffix string
param location string = deployment().location

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'azdep-${environment}-${suffix}'
  location: location
}

module rag 'deploy.bicep' = {
  name: 'deploy'
  params: {
     suffix: suffix
     environment: environment
     location: rg.location
  }
  scope: rg
}

// Output the resource group name
output resource_group_name string = rg.name
