#!/bin/sh
terraform apply -input=false -lock=false ".terraform/planfile-SERVER-${ENV}"