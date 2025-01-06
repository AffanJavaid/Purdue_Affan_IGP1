provider "aws" {
  region = var.region
  
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "key_pair_name" {
  type = string
}
variable "region" {
  type = string
}
resource "aws_instance" "Development" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name = var.key_pair_name
  tags = {
  Name = "Purdue_IGP-1"
  }
}
