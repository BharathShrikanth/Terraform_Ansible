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

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = "${module.vpc.vpc_id}"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = "${module.vpc.vpc_id}"
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = "${module.subnet.public_subnet_id}"
  sg_id = "${module.sg.sg_id}"
}

