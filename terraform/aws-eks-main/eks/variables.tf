variable "region" {
  default     = "eu-west-2"
  description = "AWS region"
}

variable "cluster_name" {
  default = "devops-eks"
}

variable "vpc_cidr" {
 default = "10.0.0.0/16"

}

variable "cluster_version" {
 default = "1.30"

}

variable "instance_type" {
 default = "t2.medium"

}