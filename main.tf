terraform {
  required_providers {
    aws = {
      source                  = "hashicorp/aws"
      version                 = "3.74.2"
    }
  }
  required_version = ">= 0.14.9"
}


# declare the provider
provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

# call the vpc module to create vpc and respective networking
module "vpc" {
  source = "./modules/vpc"
}

# call the subnet module to create a public subnet
module "subnet" {
  source = "./modules/subnet"
  vpc_id = "${module.vpc.vpc_id}"
}

# sg - security group module to allow traffic
module "sg" {
  source = "./modules/sg"
  vpc_id = "${module.vpc.vpc_id}"
}

# call the ec2 module to create an AWS EC2 instance and install nginx on it and deploy a sample web page
module "ec2" {
  source = "./modules/ec2"
  subnet_id = "${module.subnet.public_subnet_id}"
  sg_id = "${module.sg.sg_id}"
}

