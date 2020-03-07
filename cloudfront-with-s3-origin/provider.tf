
variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.aws_region
}
