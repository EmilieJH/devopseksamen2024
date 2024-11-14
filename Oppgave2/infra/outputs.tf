output "sqs_queue_url" {
  value = aws_sqs_queue.image_queue.id
}

output "lambda_function_name" {
  value = aws_lambda_function.sqs_lambda.function_name
}
