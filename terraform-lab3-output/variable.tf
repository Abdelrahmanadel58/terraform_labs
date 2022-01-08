variable "env_name" {
  type = string
  default = "project"
}

variable "customer" {
  type = string
  default = "customer"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr_block" {
  type = string
  default = "10.0.0.0/24"
}