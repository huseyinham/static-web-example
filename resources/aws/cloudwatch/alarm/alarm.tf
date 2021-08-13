locals {
  description = "${var.metric_name} ${var.comparison_operator} ${var.threshold}"
}

resource "aws_cloudwatch_metric_alarm" "scope" {
  alarm_description = local.description

  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions                = var.ok_actions
  alarm_actions             = var.alarm_actions
}