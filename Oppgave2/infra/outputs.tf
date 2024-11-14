output "lambda_function_name" {
  value = aws_lambda_function.image_generator_lambda.function_name
}

output "sqs_queue_url" {
  value = aws_sqs_queue.image_generation_queue.url
}
