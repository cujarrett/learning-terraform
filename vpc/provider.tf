variable "access_key" {
  description = "IAM access key for the infrastructure"
  type = string
}

variable "secret_key" {
  description = "IAM secret access key for the infrastructure"
  type = string
}

variable "aws_region" {
  description = "AWS region for the infrastructure"
  type = string
  default = "us-east-1"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.aws_region
}
