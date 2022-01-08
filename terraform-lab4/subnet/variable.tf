variable "env_name" {
  type = string
  default = "project"
}

variable "customer" {
  type = string
  default = "customer1"
}
variable "public_subnet1_cidr_block" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "vpc-output" {
  
}