variable "access_key" {
  description = "IAM access key for the infrastructure"
  type = string
}

variable "secret_key" {
  description = "IAM secret access key for the infrastructure"
  type = string
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
}
