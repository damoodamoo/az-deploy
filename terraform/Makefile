.PHONY: help

SHELL:=/bin/bash
MAKEFILE_FULLPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR := $(dir $(MAKEFILE_FULLPATH))

target_title = @echo -e "$(1)..."


help: ## Show this help
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
        | column -t -s '|'
	@echo


az-login:
	$(call target_title, "Logging into Azure...") \
	&& . ${MAKEFILE_DIR}/scripts/load_env.sh \
	&& echo $${TENANT_ID} \
	&& az login	--tenant $${TENANT_ID} --use-device-code \
	&& az account set --subscription $${SUBSCRIPTION_ID}
	

deploy:
	$(call target_title, "Running Terraform Deploy...") \
	&& . ${MAKEFILE_DIR}/scripts/load_env.sh \
	&& terraform init \
	&& terraform apply -auto-approve
