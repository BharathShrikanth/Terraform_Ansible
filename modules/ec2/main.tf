terraform {
  required_providers {
    aws = {
      source                  = "hashicorp/aws"
      version                 = "3.74.2"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0a3277ffce9146b74"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id
  tags = {
    Name = var.instance_name
  }
}

