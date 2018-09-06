variable "region" {
  description = "Region when you want to deploy"
}

variable "environment" {
  description = "Name of your environment"
}

variable "availability_zones" {
  description = "List of AWS will create servers"
  type        = "list"
}

variable "vpc_id" {
  description = "VPC ID where AWS deploy your cluster"
}

variable "my_aws_key" {
  description = "PATH of the key"
}

variable "keypair_name" {
  description = "Name of your key"
}
