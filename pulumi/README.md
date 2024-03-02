# Pulumi

Third party cross-cloud deployment tool, using 'regular' code.

## Pros
- Familiar code
- Constants / literals
- Easy to bootstrap

## Cons
- Wordy to get outputs

## Adding a resource
- Discovery via IntelliSense

```py
from pulumi_azure_native import cognitiveservices

openai_account = cognitiveservices.Account(
    f'azdep-openai-{environment}-{suffix}', 
    resource_group_name=resource_group.name,
    kind="OpenAI",
    sku=cognitiveservices.SkuArgs(
        name="S0"
    )
)
```
