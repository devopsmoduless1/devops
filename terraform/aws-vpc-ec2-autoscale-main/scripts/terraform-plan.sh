#/bin/sh
terraform plan -out=".terraform/planfile-SERVER-${ENV}" -lock=false