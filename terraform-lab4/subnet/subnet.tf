# public1 subnet
resource "aws_subnet" "public1" {
  count = length(var.public_subnet1_cidr_block)
  vpc_id     = var.vpc-output[count_index]
  cidr_block = var.public_subnet1_cidr_block

  tags = {
    Name = upper("${var.customer}-${var.env_name}-public-subnet1")
  }
}