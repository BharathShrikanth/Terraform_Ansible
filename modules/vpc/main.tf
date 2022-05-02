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


resource "aws_vpc" "testVPC" {
  cidr_block   = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}


