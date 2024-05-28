# Define provider
provider "aws" {
  region = "us-east-2"  # Change this to your desired AWS region
}

# Define security group
resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group"
  description = "Allow inbound traffic on specified ports"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define EC2 instances
resource "aws_instance" "ec2_instance" {
  count         = 3
  ami           = "ami-0ddda618e961f2270"  # Replace this with your desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
#   subnet_id     = "subnet-12345678"  # Replace this with your subnet ID

  security_groups = [aws_security_group.instance_security_group.name]

  tags = {
    Name = "EC2 Instance ${count.index + 1}"
  }
}
