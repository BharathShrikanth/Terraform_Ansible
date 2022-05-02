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
#  vpc_security_group_ids = [var.sg_id]
  security_groups        = [var.sg_id]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  key_name               = "testKP"
  tags = {
    Name = var.instance_name
  }

  provisioner "remote-exec" {
    # Install Python for Ansible
    inline = ["sudo yum -y install python libselinux-python"]

    connection {
      host        = aws_instance.app_server.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file(var.private_key)}"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${var.private_key} -T 300 install_nginx.yml" 
  }
}


