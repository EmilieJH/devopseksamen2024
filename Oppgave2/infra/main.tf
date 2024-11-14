terraform {
  required_version = ">= 1.9"
  backend "s3" {
    #sjekk at den er rett
    bucket = "pgr301-2024-terraform-state"
    key = "lambda-sqs-integration/terrraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}