
module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "demo-vpc"
#   cidr_block = "10.0.0.0/16"
  cidr_block = var.cidr_block
}

module "alb" {
  source              = "./modules/alb"
  name                = "demo-alb"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  security_group_id   = module.vpc.default_sg
}

module "asg" {
  source              = "./modules/asg"
  name                = "demo-asg"
  ami                 = var.ami
  instance_type       = var.instance_type
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_id   = module.vpc.default_sg
  user_data           = file("userdata.sh")
  target_group_arn    = module.alb.target_group_arn
}
