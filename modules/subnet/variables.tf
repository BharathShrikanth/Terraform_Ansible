variable "vpc_id" {
  description = "Name of the subnet to be created"
}

variable "cidr_block" {
  description = "Value of the cidr_block"
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type = string
  default = "public_subnet_1"
}
