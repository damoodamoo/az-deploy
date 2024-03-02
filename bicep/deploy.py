import os
from azure.cli.core import get_default_cli
from dotenv import load_dotenv

load_dotenv()


def az_cli(args_str, suppress_output=False):
    args = args_str.split()
    cli = get_default_cli()
    cli.invoke(
        args, out_file=open(os.devnull, "w") if suppress_output else None
    )  # suppress the stdout with out_file
    if cli.result.result:
        return cli.result.result
    elif cli.result.error:
        # maybe use CLI to query deployment and return the error details
        raise cli.result.error
    return True


result = az_cli(f"""
        deployment sub create
        --location {os.getenv('LOCATION', None)}
        --template-file main.bicep
        --parameters suffix={os.getenv('SUFFIX')} environment={os.getenv('ENVIRONMENT')}
        --proceed-if-no-change
    """)


# print outputs to allow user to copy + paste into their .env
print("------------------------------------------------------------------")
print("OUTPUTS: ")

for key, obj in result["properties"]["outputs"].items():
    print(f'{key.upper()}={obj["value"]}')

print("------------------------------------------------------------------")
