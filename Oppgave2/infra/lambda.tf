resource "aws_lambda_function" "sqs_lambda" {
  filename         = "${path.module}/function.zip"
  function_name    = var.lambda_function_name
  handler          = "lambda_sqs.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/function.zip")
  runtime          = "python3.11"
  role             = aws_iam_role.lambda_role.arn
  timeout          = 120

  environment {
    variables = {
      BUCKET_NAME = var.s3_bucket_name
      FOLDER_PREFIX   = var.s3_folder_prefix
    }
  }
}
