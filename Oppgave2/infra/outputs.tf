output "sqs_queue_url" {
  value = aws_sqs_queue.image_queue.id
}

output "lambda_function_name" {
  value = aws_lambda_function.sqs_lambda.function_name
}

# OPPGAVE 4 CODE:
output "sns_topic_arn" {
  description = "ARN of the SNS topic for alarms."
  value       = aws_sns_topic.sqs_alarm_topic.arn
}

output "cloudwatch_alarm_name" {
  description = "Name of the CloudWatch alarm."
  value       = aws_cloudwatch_metric_alarm.sqs_age_alarm.alarm_name
}
#OPPGAVE 4 END