# Terraform

Third party cross-cloud deployment tool.

## Pros
- Nicer tooling + dev experience
- Can do anything ARM can do
- Great docs + examples
- Outputs
- Provider model: can use to manage AAD apps (common need)

## Cons
- Managing state can be a pain, especially in CI
- Can feel like a lot of overhead in smaller projects

## Adding a resource
- Very good examples in docs

```hcl
resource "azurerm_cognitive_account" "openai" {
  name                = "azdep-openai-${var.environment}${var.suffix}"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  kind                = "OpenAI"
  sku_name            = "S0"
}
```
