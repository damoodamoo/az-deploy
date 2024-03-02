# Azure Deployment Tools Comparison: Starter for 10

> This repo was built to support a discussion across Dev Teams, and is not intended for much else.

This repo contains 4x different ways to deploy the same resources into Azure via IaC.

1. ARM
1. Bicep
1. Terraform
1. Pulumi

Each example deploys a simple storage account, and contains instructions in the README to add an OpenAI endpoint. 

Whilst you can use any tool to complete the task, the purpose here is to compare the developer experience in the following ways:

- _How easy is it to get up and running?_
- _How readable is it?_
- _How easy is it to add resources to an existing codebase?_
- _Other pros or limitations_

As an aside, each uses a different wrapper script to trigger the deployments. Again, they all do the same job, but what are the preferences in terms of longer term manageability?
