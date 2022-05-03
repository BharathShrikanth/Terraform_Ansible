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
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.testVPC.id

  tags = {
    Name = "testigw"
  }
}

resource "aws_route_table" "igw_route" {
  vpc_id = aws_vpc.testVPC.id

#  route {
#    cidr_block = "10.0.0.0/16"
#    gateway_id = aws_internet_gateway.gw.id
#  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "igw_route"
  }
}


resource "aws_main_route_table_association" "rt_association" {
  vpc_id = aws_vpc.testVPC.id
  route_table_id = aws_route_table.igw_route.id
}


