resource "aws_ecs_cluster" "ant_api" {
  name = "${var.environment}-ecs-ant"
}

resource "aws_launch_configuration" "ant_api" {
  image_id      = "ami-0d438d09af26c9583"
  instance_type = "t2.medium"
  depends_on    = ["aws_ecs_cluster.ant_api"]

  root_block_device {
    volume_type           = "standard"
    volume_size           = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups             = ["sg-0ab131013adcde190"]
  associate_public_ip_address = "true"
  key_name                    = "${var.keypair_name}"
  iam_instance_profile        = "demo-iam-instance-role"

  user_data = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.ant_api.name} > /etc/ecs/ecs.config"
}

resource "aws_autoscaling_group" "ant_api" {
  max_size             = "5"
  min_size             = "2"
  desired_capacity     = "2"
  vpc_zone_identifier  = ["subnet-09172beb19273a379", "subnet-06de462142642e0c5"]
  launch_configuration = "${aws_launch_configuration.ant_api.name}"
  health_check_type    = "EC2"
  depends_on           = ["aws_launch_configuration.ant_api"]

  tag {
    key                 = "Environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.environment}-ecs-ant"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "Terraform"
    propagate_at_launch = true
  }

  tag {
    key                 = "Hero"
    value               = "ant"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "ant_api_cpu_policy" {
  name = "${var.environment}-ecs-ant-cpu-policy"

  autoscaling_group_name = "${aws_autoscaling_group.ant_api.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "ant_api_cpu_policy_scaledown" {
  name                   = "${var.environment}-ecs-ant-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.ant_api.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "ant_api_cpu_policy" {
  alarm_name          = "${var.environment}-ecs-ant-cpu-alarm"
  alarm_description   = "${var.environment}-ecs-ant-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "95"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.ant_api.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.ant_api_cpu_policy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "ant_api_cpu_policy_scaledown" {
  alarm_name          = "${var.environment}-ecs-ant-cpu-alarm-scaledown"
  alarm_description   = "${var.environment}-ecs-ant-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.ant_api.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.ant_api_cpu_policy_scaledown.arn}"]
}
