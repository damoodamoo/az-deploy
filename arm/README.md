# ARM Templates

Massive JSON files.

## Pros
- Can deploy any resource, and have control over API version.

## Pain Points
- Very poor docs + examples
- Verbose
- Embedded functions get very unwieldy
- etc...

## Adding a resource
- Tooling gives me snippets for them, but doesn't help with structure (such as blob container)
- Azure REST API docs? https://learn.microsoft.com/en-us/rest/api/?view=Azure
- Have to go to service specific page, and then get given json example, very poorly documented.
  - https://learn.microsoft.com/en-us/azure/templates/microsoft.cognitiveservices/accounts?pivots=deployment-language-arm-template
  - No mandatory props explained
  - Each prop very basic description, or even misleading

```json
 {
    "type": "Microsoft.CognitiveServices/accounts",
    "apiVersion": "2023-05-01",
    "name": "[concat('azdep-openai-', parameters('environment'), parameters('suffix'))]",
    "location": "[parameters('location')]",
    "sku": {
        "name": "",
        "tier": ""
    },
    "kind": "",
    "properties": {}
}
```

