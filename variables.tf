variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ssh-root"  # Replace with your key pair name
}

variable "subnet_id" {
  description = "subnet-0e9f14c67522c0055"
}

variable "ami" {
  default = "ami-0ddda618e961f2270"  # Replace with your preferred AMI
}

variable "vpc_id" {
  description = "vpc-026a6442e07a2ac87"
  type        = string
}