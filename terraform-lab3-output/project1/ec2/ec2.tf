# public instance
resource "aws_instance" "web" {
  ami           = "ami-060867d58b989c6be" 
  instance_type = var.instance-ec2-type
  subnet_id = var.subnet-id-ec2

  tags = {
    Name = "${var.customer}-${var.env_name}-EC2-instance"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install redis-server -y
                sudo systemctl restart redis.service
                EOF
}