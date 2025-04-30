# Declare version
terraform {
  required_version = ">= 1.3.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.58"
    }
  }
}


provider "aws" {
  region  = "eu-west-2"
}
