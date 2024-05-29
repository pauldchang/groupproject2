provider "aws" {
  region = "us-east-2"
}

variable "instance_count" {
  default = 3
}

variable "ami" {
  default = "ami-0ddda618e961f2270"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "paul"
}

resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group"
  description = "Allow inbound traffic for specified ports"

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
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance_security_group"
  }
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.instance_security_group.name]

  tags = {
    Name = "example-instance-${count.index + 1}"
  }
}
