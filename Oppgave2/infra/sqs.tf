# SQS queue
resource "aws_sqs_queue" "image_generation_queue" {
  name                       = var.sqs_queue_name
  visibility_timeout_seconds = var.lambda_timeout
}
