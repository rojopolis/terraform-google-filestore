set -e

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/../examples"
terraform validate
terraform plan -out plan.tfplan
terraform apply plan.tfplan
terraform destroy -auto-approve
popd