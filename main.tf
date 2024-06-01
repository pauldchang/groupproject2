provider "aws" {
  region = var.region
}

resource "aws_instance" "swarm_instances" {
  count         = 3
  instance_type = var.instance_type
  ami           = var.ami
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  

  vpc_security_group_ids = [aws_security_group.swarm_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "swarm-instance-${count.index + 1}"
  }
}
