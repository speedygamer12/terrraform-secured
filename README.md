# Terraform DevOps
![Build-workflow](https://github.com/speedygamer12/az-terraform-secured/actions/workflows/setup-workflow.yml/badge.svg)
<hr />

## What is this project?
Azure infrastructures deployed using Terraform, while implementing static code analysis, vulnerability-checks, compliance-testing, remote state management.

> Run code:
- Configure Azure on Linux: ![here](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash)
- Clone repository and change directory: 
`git clone https://github.com/speedygamer12/az-terraform-secured && cd az-terraform-secured`
- Create Remote State with Azure Storage: `make state`
- Deploy infrastructures: `make`
- Delete infrastructures: `make clean`

Note: The Storage account name of our Azure Storage account for state files has a randomly generated value in its name.
Ensure to manually check the name and reflect it in the backend block of the terraform providers file on first run.
    

## Features:
- Makefile for terraform modules
- Bash script for Declarative use of modules
- Remote State management 

## Details
### Linting with tflint
- Added type to variable resource_group_name_prefix

### Vulnerability scan with tfsec
https://github.com/aquasecurity/tfsec
- Scan modules to check for misconfigurations on our infrastructure codes.
- Fixed azure-storage-use-secure-tls-policy by setting min_tls_version to allow 1.2
- Silent azure-network-ssh-blocked-from-internet and azure-network-no-public-ingress
### Static Code Analysid with Tfscan:
https://github.com/tenable/terrascan
- Monitor provisioned cloud infrastructure for configuration changes that introduce posture drift.
### Compliance with Terraform-compliance:
- Apply behavior-driven development(BDD) principles to define strict compliance
- Translated BDD rules using cucumber which ensure tags and labels in all resources
- Bash script to declaritively use the run_compliance modules
- Tools: Docker, Python, terraform-compliance

### Store state files in Azure storage:
- Azure Storage blobs are automatically locked before any operation that writes state to prevent corruption.
- Data stored in the Azure blob is encrypted before being persisted so that state is never writtern to the local disk.

Improvements:
- Impement unit-testing and end-end testing with terratest
- Experiment with checkov, terrafirma, and conftest for static code analysis and testing
- Write terratest to check for inbound ssh to vm.
