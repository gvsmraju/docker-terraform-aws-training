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

variable "vpc_subnets" {
  description = "List of subnets in your VPC"
  type        = "list"
}

variable "security_groups" {
  description = "List of security groups in your VPC"
  type        = "list"
}

variable "lb_security_groups" {
  description = "List of security groups in your VPC"
  type        = "list"
}

variable "hero" {
  description = "NAme of your HERO"
}

variable "cluster_name" {
  description = "Name of your cluster"
}

variable "docker_url" {
  description = "URL of your docker"
}
