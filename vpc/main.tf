variable "vpcName" {
  type = string
  default = "TerraformVpc"
}

resource "aws_vpc" "myFirstVpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = var.vpcName
  }
}

output "vpcId" {
  value = aws_vpc.myFirstVpc.id
}
