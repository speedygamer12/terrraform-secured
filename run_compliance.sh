#!/bin/bash
# set -euo pipfail

test_dir=$1
run_terraform_plan(){
  terraform validate && terraform plan -out "${test_dir}/main.tfplan"
  terraform show -json main.tfplan > main.tfplan.json
}

run_tf_compliance() { 
  [ -f "${test_dir}/main.tfplan.json" ] || run_terraform_plan "${test_dir}"
  # docker pull eerkunt/terraform-compliance
  docker run --rm -v ${test_dir}:/target -it eerkunt/terraform-compliance -f features -p main.tfplan.json
}

run_main() {
  run_tf_compliance
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Running main script ..."
  run_main
fi