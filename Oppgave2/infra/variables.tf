variable "lambda_function_name" {
  description = "Name of Lambda function"
  default     = "sqs_image_processor-63"
}

variable "sqs_queue_name" {
  description = "Name of SQS queue"
  default     = "image_generation_queue-63"
}

variable "s3_bucket_name" {
  description = "Name of S3-bucket"
  default     = "pgr301-couch-explorers"
}

variable "s3_folder_prefix" {
  description = "Name of the folder images should be stored in"
  default     = "63"
}

# OPPGAVE 4 CODE:
variable "alarm_email" {
  description = "E-mail for CloudWatch-alarm."
  type        = string
}
# OPPGAVE 4 end