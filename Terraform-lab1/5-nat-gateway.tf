# elstic ip
resource "aws_eip" "main" {
  vpc = true
}
# nat gateway 
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public1.id

  tags = {
            Name = "${var.customer}-${var.env_name}-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}