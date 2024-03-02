#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

source .env

GROUP_NAME="azdep-${ENVIRONMENT}-${SUFFIX}"

az group create --name "${GROUP_NAME}" --location "${LOCATION}"

az deployment group create \
    --name armdeployment \
    --resource-group "${GROUP_NAME}" \
    --template-file "template.json" \
    --parameters '{"environment": {"value": "'${ENVIRONMENT}'"}, "suffix": {"value":"'${SUFFIX}'"}}'

