resource "aws_default_security_group" "sg_docker_demo" {
  vpc_id = "${aws_vpc.demo_docker.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
    description = "Allow ALL trafics from the subnet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-ecs"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "sg_docker_demo_ssh" {
  vpc_id      = "${aws_vpc.demo_docker.id}"
  description = "Allow ssh for ecs"
  name        = "${var.environment}-ecs-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL trafics from the office"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-ecs-ssh"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "sg_lb_demo_http" {
  vpc_id      = "${aws_vpc.demo_docker.id}"
  description = "Allow ssh for lb"
  name        = "${var.environment}-lb-http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL trafics from the office"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-lb-http"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "sg_docker_demo_http" {
  vpc_id      = "${aws_vpc.demo_docker.id}"
  description = "Allow ssh for ecs"
  name        = "${var.environment}-ecs-http"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups= ["${aws_security_group.sg_lb_demo_http.id}"]    
    description = "Allow ALL trafics from the office"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-ecs-http"
    Environment = "${var.environment}"
  }
}
