#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

source .env

az login --tenant ${TENANT_ID} --use-device-code
az account set --subscription ${SUBSCRIPTION_ID}
