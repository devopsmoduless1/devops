#!/bin/sh
terraform plan -destroy -out=".terraform/destroy-planfile-SERVER-${ENV}" -lock=false