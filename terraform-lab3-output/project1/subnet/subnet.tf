# public1 subnet
resource "aws_subnet" "public1" {
  vpc_id     = var.vpc-output
  cidr_block = var.public_subnet1_cidr_block

  tags = {
    Name = "${var.customer}-${var.env_name}-public-subnet1"
  }
}