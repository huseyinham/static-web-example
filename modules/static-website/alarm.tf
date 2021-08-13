module "static-website-alarm" {
  source = "../../resources/aws/cloudwatch/alarm"

  alarm_name          = "${terraform.workspace}-cloudfront-5XX"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = 120
  statistic           = "Average"
  threshold           = 20
  alarm_actions       = [] # if this was a proper system, it would link up to an alerting system or SNS etc to alert

  depends_on = [
    module.static-website-cloudfront
  ]
}