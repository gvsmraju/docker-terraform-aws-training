output "vpc_id" {
  description = "The id of the VPC."
  value       = "${aws_vpc.demo_docker.id}"
}

output "vpc_cidr" {
  description = "The CDIR block used for the VPC."
  value       = "${aws_vpc.demo_docker.cidr_block}"
}

output "public_subnets_prod" {
  description = "A list of the public subnets for production"
  value       = ["${aws_subnet.demo_docker_subnet_a.*.id}"]
}

output "public_subnets_staging" {
  description = "A list of the public subnets for staging"
  value       = ["${aws_subnet.demo_docker_subnet_b.*.id}"]
}
