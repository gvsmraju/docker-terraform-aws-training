variable "environment" {
  description = "A logical name that will be used as prefix and tag for the created resources."
  type        = "string"
  default     = "liberty-staging"
}

variable "aws_region" {
  type        = "string"
  description = "The Amazon region."
}

variable "vpc_cidr_block" {
  description = "The CDIR block used for the VPC COINS"
}

variable "vpc_cidr_block_subnet_a" {
  description = "The CDIR block used for the VPC PROD"
}

variable "vpc_cidr_block_subnet_b" {
  description = "The CDIR block used for the VPC STAGING"
}

variable "vpc_availability_zones_subnet_b" {
  type = "map"

  default = {
    us-west-1 = ["us-west-1c"]
  }
}

variable "vpc_availability_zones_subnet_a" {
  type = "map"

  default = {
    us-west-1 = ["us-west-1a"]
  }
}
