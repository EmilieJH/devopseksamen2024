# OPPGAVE 4

resource "aws_cloudwatch_metric_alarm" "sqs_age_alarm" {
  alarm_name          = "SQS_Alarm_63"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = "300" # 5 minutes
  statistic           = "Maximum"
  threshold           = "600" # 10 minutes
  alarm_description   = "Alarm when the oldest in the SQS queue is older than 10 minutes."
  dimensions = {
    QueueName = var.sqs_queue_name
  }

  alarm_actions = [
    aws_sns_topic.sqs_alarm_topic.arn
  ]

  ok_actions = [
    aws_sns_topic.sqs_alarm_topic.arn
  ]
}
