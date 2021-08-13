variable "alarm_name" {}
variable "comparison_operator" {}
variable "evaluation_periods" {}
variable "metric_name" {}
variable "namespace" {}
variable "period" {}
variable "statistic" {}
variable "threshold" {}
variable "insufficient_data_actions" {
  default = []
}
variable "ok_actions" {
  default = []
}
variable "alarm_actions" {
  default = []
}