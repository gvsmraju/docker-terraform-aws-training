###################
#  ELB to the docker
###################

resource "aws_lb_target_group" "hero" {
  name     = "${var.environment}-${var.hero}-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  stickiness {
    type    = "lb_cookie"
    enabled = false
  }

  health_check = {
    path = "/my"
  }
}

resource "aws_lb" "hero" {
  name               = "${var.environment}-${var.hero}-lb"
  subnets            = "${var.vpc_subnets}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.lb_security_groups}"

  tags {
    Name        = "${var.environment}-${var.hero}-lb"
    Environment = "chaindata-heros"
    hero        = "${var.hero}"
    Owner       = "Terraform"
  }
}

resource "aws_lb_listener" "hero" {
  load_balancer_arn = "${aws_lb.hero.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.hero.id}"
    type             = "forward"
  }
}
