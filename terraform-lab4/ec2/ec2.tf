# public instance
resource "aws_instance" "ubuntu" {
  count = var.my_ec2 ? 1:0
  ami           = "ami-09fa0d72d00d79024" 
  instance_type = var.instance-ec2-type
  subnet_id = var.subnet-id-ec2

  tags = {
    Name = upper("${var.customer}-${var.env_name}-EC2-instance")
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install redis-server -y
                sudo systemctl restart redis.service
                EOF
}