resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = upper("${var.customer}-${var.env_name}-lab")
  }
}