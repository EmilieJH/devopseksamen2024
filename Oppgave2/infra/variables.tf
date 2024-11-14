variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "image-generator-sqs-63"
}

variable "sqs_queue_name" {
  description = "Name of SQS queue"
  type        = string
  default     = "image-generator-sqs-queue-63"
}

variable "s3_bucket_name" {
  description = "Name of S3 bucket"
  type        = string
  default     = "pgr301-couch-explorers"
}

variable "lambda_timeout" {
  description = "Timeout in seconds"
  type        = number
  default     = 30
}
