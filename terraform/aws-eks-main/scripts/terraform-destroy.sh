#!/bin/sh
terraform apply -input=false -lock=false ".terraform/destroy-planfile-SERVER-${ENV}"
