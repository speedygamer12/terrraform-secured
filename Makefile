.PHONY: format initialize validate plan lint security_scan static_code_analysis 
		compliance_test apply destroy, state
all: format initialize validate plan lint security_scan static_code_analysis 
		compliance_test state apply

format:
	@echo "Formatting terraform files"
	terraform fmt

initialize:
	@echo "Initializing terraform files"
	terraform init

validate:
	@echo "Validating terraform files"
	terraform validate

plan:	
	@echo "Planning terraform files"
	terraform plan -out main.tfplan
	
create:
	@echo "Creating resources"
	terraform apply

clean:
	@echo "Removing resources"
	terraform destroy

lint:
	@echo "Linting terraform files"
	tflint

security_scan:
	@echo "Scanning for Vulenerabilities"
	tfsec .

compliance_test:
	@echo "testing for compliance"
	./run_compliance.sh $(PWD)

state:
	@echo "Creating Remote terraform state"
	cd terraform-state-storage; terraform init; terraform apply


# end_to_end_testing:
# 	@echo "testing resources"
# 	terratest


# static_code_analysis:
# 	terrascan

# policy_as_code:
# 	checkov --directory .





