"""An Azure RM Python Pulumi program"""
import os
import pulumi
from pulumi_azure_native import storage
from pulumi_azure_native import resources
from pulumi_azure_native import cognitiveservices


from dotenv import load_dotenv
load_dotenv()

environment = os.getenv("ENVIRONMENT")
suffix = os.getenv("SUFFIX")

# Create an Azure Resource Group
resource_group = resources.ResourceGroup(f'azdep-{environment}-{suffix}')

# Create an Azure resource (Storage Account)
account = storage.StorageAccount(
    f'azdep{environment}{suffix}',
    resource_group_name=resource_group.name,
    sku=storage.SkuArgs(
        name=storage.SkuName.STANDARD_LRS,
    ),
    kind=storage.Kind.STORAGE_V2,
)


openai_account = cognitiveservices.Account(
    f'azdep-openai-{environment}-{suffix}', 
    resource_group_name=resource_group.name,
    kind="OpenAI",
    sku=cognitiveservices.SkuArgs(
        name="S0"
    )
)


# Export the primary key of the Storage Account
primary_key = (
    pulumi.Output.all(resource_group.name, account.name)
    .apply(
        lambda args: storage.list_storage_account_keys(
            resource_group_name=args[0], account_name=args[1]
        )
    )
    .apply(lambda accountKeys: accountKeys.keys[0].value)
)

pulumi.export("primary_storage_key", primary_key)
