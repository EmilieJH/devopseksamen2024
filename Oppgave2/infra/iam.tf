# IAM role for Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "${var.lambda_function_name}-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  })
}

# IAM Policy for S3 access
resource "aws_iam_policy" "s3_access_policy" {
  name        = "${var.lambda_function_name}-s3-policy"
  description = "Policy for Lambda tilgang til S3"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:PutObject",
          "s3:PutObjectAcl"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${var.s3_bucket_name}/63/*"
      }
    ]
  })
}

# IAM Policy for Bedrock access
resource "aws_iam_policy" "bedrock_access_policy" {
  name        = "${var.lambda_function_name}-bedrock-policy"
  description = "Policy for Lambda tilgang til Bedrock"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "bedrock:InvokeModel"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  })
}

# Attach policies to IAM role
resource "aws_iam_role_policy_attachment" "lambda_s3_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_bedrock_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.bedrock_access_policy.arn
}

# AWS Managed Policy for basic Lambda execution
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
