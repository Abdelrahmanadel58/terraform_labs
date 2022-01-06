data "aws_vpc" "main" {
  filter {
      name = "tag:Name"
      values = ["${var.name}-${var.customer}-vpc"]
  }
}
