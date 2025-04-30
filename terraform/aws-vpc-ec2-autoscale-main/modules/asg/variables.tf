variable "name" {}
variable "ami" {}
variable "instance_type" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "private_subnet_ids" { type = list(string) }
variable "security_group_id" {}
variable "user_data" {}
variable "target_group_arn" {}
