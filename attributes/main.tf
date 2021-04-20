variable "access_key" {
  description = "IAM access key for the infrastructure"
  type = string
}

variable "secret_key" {
  description = "IAM secret access key for the infrastructure"
  type = string
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "learning-terraform-attribute-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}
