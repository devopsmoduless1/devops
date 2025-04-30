resource "aws_launch_template" "web" {
  name_prefix   = var.name
  image_id      = var.ami
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.security_group_id]
  }

  user_data = base64encode(var.user_data)
}

resource "aws_autoscaling_group" "web" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [var.target_group_arn]
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}
