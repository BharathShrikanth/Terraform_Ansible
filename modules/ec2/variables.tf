variable "instance_name" {
   description = "Name of the instance"
   type        = string
   default     = "instance_1"
}

variable "subnet_id" {
}

variable "sg_id" {
}

variable "private_key" {
   default = "/root/.ssh/testKP.pem"
}
