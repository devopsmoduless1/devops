resource "aws_launch_template" "lt" {
  name_prefix   = "example-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group]
  }
}

