SHELL := /bin/bash
TERRAFORM_APPLY_START = "terraform apply -auto-approve"

terraform-init:
	@terraform init

terraform-apply:
	@"${TERRAFORM_APPLY_START}"

.PHONY = terraform-init terraform-apply
