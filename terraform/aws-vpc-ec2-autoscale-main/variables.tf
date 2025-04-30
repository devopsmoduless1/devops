### variables.tf
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.small"
}

variable "cidr_block" {
  description = "CIDR Block"
  default     = "10.0.0.0/16"
}
