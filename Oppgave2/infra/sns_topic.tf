# OPPGAVE 4

resource "aws_sns_topic" "sqs_alarm_topic" {
  name = "sqs-alarm-topic-63"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sqs_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}
