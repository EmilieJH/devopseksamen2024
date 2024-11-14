resource "aws_sqs_queue" "image_queue" {
  name                       = var.sqs_queue_name
  visibility_timeout_seconds = 60
  message_retention_seconds  = 86400
}
