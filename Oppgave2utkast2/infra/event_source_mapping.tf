resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.image_queue.arn
  function_name    = aws_lambda_function.sqs_lambda.arn
  batch_size       = 1
  enabled          = true
  StartingPosition = "LATEST"
}