#######################
#  ECS for the explorer
#######################

data "template_file" "docker" {
  template = "${file("./myhero.json")}"

  vars {
    DOCKER_URL = "${var.docker_url}"
    HERO       = "${var.hero}"
  }
}

resource "aws_ecs_task_definition" "hero" {
  family                = "myhero-${var.hero}"
  container_definitions = "${data.template_file.docker.rendered}"
}

resource "aws_ecs_service" "hero" {
  name                               = "myhero-${var.hero}"
  cluster                            = "arn:aws:ecs:us-west-1:371075088726:cluster/${var.cluster_name}"
  task_definition                    = "${aws_ecs_task_definition.hero.arn}"
  desired_count                      = "2"
  depends_on                         = ["aws_lb_listener.hero"]
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 100

  load_balancer {
    target_group_arn = "${aws_lb_target_group.hero.id}"
    container_name   = "myhero-${var.hero}"
    container_port   = "5000"
  }
}
