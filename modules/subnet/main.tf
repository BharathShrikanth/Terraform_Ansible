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

resource "aws_subnet" "public_subnet_1" {
  vpc_id       = var.vpc_id
  cidr_block   = var.cidr_block
  availability_zone = "ap-south-1a"
  tags = {
    Name = var.public_subnet_name
  }
}

