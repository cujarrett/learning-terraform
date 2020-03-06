variable "access_key" {
  description = "IAM access key for the infrastructure"
}

variable "secret_key" {
  description = "IAM secret access key for the infrastructure"
}

variable "aws_region" {
  description = "AWS region for the infrastructure"
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}
