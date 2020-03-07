variable "vpc_name" {
  type = string
  default = "my_vpc"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = var.vpc_name
  }
}

output "vpc_details" {
  value = aws_vpc.vpc
}
