.PHONY: all list-better list init validate plan plan-with-no-colour deploy apply destroy destroy-apply

CURRENT_DIR=$(notdir $(CURDIR))

ifndef  REGION
override REGION = sandbox
endif
ifndef  ENVIRONMENT
override ENVIRONMENT = sandboxqa
endif
ifndef  BACKEND
override BACKEND = pipeline
endif

all: init plan-with-no-colour

list:
	@grep '^[^#[:space:]].*:' Makefile

list-better:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

init:
	@echo "Removing cached terraform modules."
	@echo "-backend-config=../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/backend-local.conf"
	@echo "-var-file=../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars"
	@rm -Rf .terraform/modules
	@echo "Initialiasing terraform for **${CURRENT_DIR} **"
	@terraform init -no-color -reconfigure \
        -backend-config="./backend.conf" \
        -backend-config="backend-${BACKEND}.conf" \
        -backend-config="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/backend-local.conf" \
        -var-file="../env/common/terraform.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
	    -var="APP_REGION=${REGION}"
	@echo "Validating terraform code."
	@terraform validate -no-color

validate:
	@echo "Validating terraform code."
	@terraform validate -no-color

plan: validate
	@echo "Running a terraform plan on ** $(notdir $(CURDIR)) **"
	@terraform plan -parallelism=30 \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
	    -var="APP_REGION=${REGION}" \
        -refresh=true

destroy: validate
	@echo "Running a terraform plan destroy on ** $(notdir $(CURDIR)) **"
	@terraform plan -destroy -parallelism=30 \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
	    -var="APP_REGION=${REGION}" \
        -refresh=true

plan-with-no-colour: validate
	@echo "Running a terraform plan on ** $(notdir $(CURDIR)) **"
	@terraform plan -lock=false -parallelism=30 -no-color \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
	    -var="APP_REGION=${REGION}" \
        -refresh=true -out=plan.out

deploy: validate
	@echo "Deploying the infrastructure on ** $(notdir $(CURDIR)) **"
	@terraform apply -no-color -auto-approve \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
	    -var="APP_REGION=${REGION}"


destroy-deploy: validate
	@echo "Destroying the infrastructure on ** $(notdir $(CURDIR)) **"
	@terraform plan -destroy -parallelism=30 \
        -var-file="../env/${REGION}/${ENVIRONMENT}/${CURRENT_DIR}/terraform.tfvars" \
        -var-file="./common.tfvars" \
        -var-file="../env/${REGION}/common/env.tfvars" \
        -var-file="../env/${REGION}/${ENVIRONMENT}/common/env.tfvars" \
	    -var="APP_REGION=${REGION}" \
        -refresh=true -out=plan.out
	@terraform apply plan.out



apply: validate deploy
	@echo "Deployment is completed on ** $(notdir $(CURDIR)) **"

destroy-apply: validate destroy-deploy
	@echo "Destroy Deployment is completed on ** $(notdir $(CURDIR)) **"
