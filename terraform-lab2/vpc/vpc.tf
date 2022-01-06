resource "aws_vpc" "main" {
  cidr_block = var.ip
  tags = {
    Name = "${var.name}-${var.customer}-vpc"
  }
}