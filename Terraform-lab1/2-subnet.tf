# public1 subnet
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet1_cidr_block
  availability_zone = "af-south-1a"

  tags = {
    Name = "${var.customer}-${var.env_name}-public-subnet1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet2_cidr_block
  availability_zone = "af-south-1b"

  tags = {
    Name = "${var.customer}-${var.env_name}-public-subnet2"
  }
}

# private subnet
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1_cidr_block
  availability_zone = "af-south-1a"

  tags = {
    Name = "${var.customer}-${var.env_name}-private-subnet1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2_cidr_block
  availability_zone = "af-south-1b"

  tags = {
    Name = "${var.customer}-${var.env_name}-private-subnet2"
  }
}