provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "demo_docker" {
  cidr_block           = "${cidrsubnet(var.vpc_cidr_block, 0, 0)}"
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "demo_docker" {
  vpc_id = "${aws_vpc.demo_docker.id}"

  tags {
    Name        = "${var.environment}-internet-gateway"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "demo_docker_subnet_a" {
  vpc_id = "${aws_vpc.demo_docker.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo_docker.id}"
  }

  tags {
    Name        = "${var.environment}-vpc-public-route-table"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "demo_docker_subnet_b" {
  vpc_id = "${aws_vpc.demo_docker.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo_docker.id}"
  }

  tags {
    Name        = "${var.environment}-vpc-public-route-table"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "demo_docker_subnet_a" {
  vpc_id            = "${aws_vpc.demo_docker.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr_block_subnet_a, 1, count.index)}"
  availability_zone = "${element(var.vpc_availability_zones_subnet_a[var.aws_region], count.index)}"
  count             = "${length(var.vpc_availability_zones_subnet_a[var.aws_region])}"

  tags {
    Name        = "${var.environment}-${element(var.vpc_availability_zones_subnet_a[var.aws_region], count.index)}-coin-public"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "demo_docker_subnet_a" {
  subnet_id      = "${element(aws_subnet.demo_docker_subnet_a.*.id, count.index)}"
  route_table_id = "${aws_route_table.demo_docker_subnet_a.id}"
  count          = "${length(var.vpc_availability_zones_subnet_a[var.aws_region])}"
}

resource "aws_subnet" "demo_docker_subnet_b" {
  vpc_id            = "${aws_vpc.demo_docker.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr_block_subnet_b, 1, count.index)}"
  availability_zone = "${element(var.vpc_availability_zones_subnet_b[var.aws_region], count.index)}"
  count             = "${length(var.vpc_availability_zones_subnet_b[var.aws_region])}"

  tags {
    Name        = "${var.environment}-${element(var.vpc_availability_zones_subnet_b[var.aws_region], count.index)}-staging-public"
    Environment = "${var.environment}-staging"
  }
}

resource "aws_route_table_association" "demo_docker_subnet_b" {
  subnet_id      = "${element(aws_subnet.demo_docker_subnet_b.*.id, count.index)}"
  route_table_id = "${aws_route_table.demo_docker_subnet_b.id}"
  count          = "${length(var.vpc_availability_zones_subnet_b[var.aws_region])}"
}
