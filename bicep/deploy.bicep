param suffix string
param environment string
param location string

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'azdep${environment}${suffix}'
  location: location

  sku: {
    name: 'Standard_LRS'
  }

  kind: 'Storage'
}

resource storageBlobService 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  name: 'default'
  parent: storageAccount
}

resource storageContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: 'my-container'
  parent: storageBlobService
}

resource openAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'azdep1-openai-${environment}${suffix}'
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {}
}


// Outputs
output storage_acct_name string = storageAccount.name
output container_name string = storageContainer.name
