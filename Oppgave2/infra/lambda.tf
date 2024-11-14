# S3 bucket for Lambda code
resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = "${var.lambda_function_name}-code-bucket"
}

# Upload Lambda code to S3
resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_code_bucket.bucket
  key    = "function.zip"
  source = "lambda/function.zip"
}

# Lambda function
resource "aws_lambda_function" "image_generator_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_sqs.lambda_handler"
  runtime       = "python3.11"
  timeout       = var.lambda_timeout
  package_type  = "Zip"

  s3_bucket        = aws_s3_bucket.lambda_code_bucket.bucket
  s3_key           = aws_s3_object.lambda_zip.key
  source_code_hash = filebase64sha256("lambda_code/function.zip")

  environment {
    variables = {
      BUCKET_NAME = var.s3_bucket_name
      S3_PREFIX   = "63/"
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.lambda_s3_attachment,
    aws_iam_role_policy_attachment.lambda_bedrock_attachment,
    aws_iam_role_policy_attachment.lambda_basic_execution
  ]
}

# SQS trigger for Lambda
resource "aws_lambda_event_source_mapping" "sqs_event_source" {
  event_source_arn = aws_sqs_queue.image_generation_queue.arn
  function_name    = aws_lambda_function.image_generator_lambda.arn
  batch_size       = 1
}

# Allow SQS to invoke Lambda
resource "aws_lambda_permission" "allow_sqs" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.image_generator_lambda.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = aws_sqs_queue.image_generation_queue.arn
}
