variable "site_name" {
  description = "Site name"
  type = string
  default = "2020-03-06-foo-bar"
}

variable "aws_region" {
  description = "AWS Region the infrastructure will be created in"
  type = string
  default = "us-east-1"
}
