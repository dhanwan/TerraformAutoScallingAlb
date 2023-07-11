variable "vpc_name" {
  type        = string
  description = "Name of the vpc"
  default     = "myzone-dev"
}

variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["192.168.5.0/24", "192.168.15.0/24", "192.168.25.0/24"]
}

variable "db_subnets" {
  type    = list(string)
  default = ["192.168.50.0/24", "192.168.60.0/24", "192.168.70.0/24"]
}

