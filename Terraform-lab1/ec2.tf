# private instance
resource "aws_instance" "Database1" {
  ami           = "ami-060867d58b989c6be" 
  instance_type = "t3.micro"
  availability_zone = "af-south-1a"
  subnet_id = aws_subnet.private1.id

  tags = {
    Name = "ubuntu"
  }
}

resource "aws_instance" "Database2" {
  ami           = "ami-060867d58b989c6be" 
  instance_type = "t3.micro"
  availability_zone = "af-south-1b"
  subnet_id = aws_subnet.private2.id

  tags = {
    Name = "ubuntu2"
  }
}

# public instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-060867d58b989c6be" 
  instance_type = "t3.micro"
  availability_zone = "af-south-1a"
  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "ubuntu"
  }
}


resource "aws_instance" "ubuntu2" {
  ami           = "ami-060867d58b989c6be" 
  instance_type = "t3.micro"
  availability_zone = "af-south-1b"
  subnet_id = aws_subnet.public2.id

  tags = {
    Name = "ubuntu2"
  }
}
# security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# RDS
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_subnet_group_name = "${aws_db_subnet_group.RDS.name}"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


resource "aws_db_subnet_group" "RDS" {
  name = "main"
  subnet_ids = [aws_subnet.private1.id , aws_subnet.private2.id]

  tags = {
    Name = "RDS-group"
  }
}

resource "aws_subnet" "private3" {
  availability_zone = "af-south-1b"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "pure-private-1"
  }
}

# subnet pure for RDS
resource "aws_instance" "ec2-pure-private3" {
  ami               = "ami-060867d58b989c6be"
  instance_type     = "t3.micro"
  subnet_id = aws_subnet.private3.id
  availability_zone = "af-south-1b"

  tags = {
    Name = "Datebase"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install redis-server -y
                sudo systemctl restart redis.service
                EOF
}