# vpc
module "vpc-module" {
  source = "./vpc"
  env_name = var.env_name
  customer = var.customer
  vpc_cidr_block = var.vpc_cidr_block
}

# subnet
module "subnet-module" {
  source = "./subnet"
  env_name = var.env_name
  customer = var.customer
  public_subnet1_cidr_block = var.public_subnet1_cidr_block
  vpc-output = module.vpc-module.vpc-output
}

# ec2
module "ec2-module" {
  source = "./ec2"
  env_name = var.env_name
  customer = var.customer
  instance-ec2-type = "t3.micro"
  subnet-id-ec2 = module.subnet-module.subnet-output
}

# security-group
module "security-group-module" {
  source = "./security-group"
  env_name = var.env_name
  customer = var.customer
  vpc-id-security-group = module.vpc-module.vpc-output
}