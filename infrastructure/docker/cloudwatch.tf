resource "aws_cloudwatch_log_group" "logs_heros" {
  name = "myhero-${var.hero}"

  tags {
    Name        = "myhero-${var.hero}"
    Environment = "${var.environment}"
  }
}