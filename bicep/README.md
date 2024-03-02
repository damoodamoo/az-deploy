# Bicep

Abstraction over ARM.

## Pros
- Nicer tooling + dev experience
- Can do anything ARM can do

## Cons
- Docs :|
- Sometimes need to query deployment to get error messages
- Have to get some outputs by hand

## Adding a resource
- Can use tooling to discover

```bicep
resource openAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'azdep-openai-${environment}${suffix}'
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {}
}
```