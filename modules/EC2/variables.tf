variable "instance_name" {
  default = "Project Application Server"
}

variable "ami_id" {
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  default = "t3a.medium"
}

variable "key_name" {
  default = "Project-Application-Server"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}
