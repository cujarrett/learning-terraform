variable "ec2Name" {
  type = string
}

resource "aws_instance" "moduleEc2" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  tags = {
    name = var.ec2Name
  }
}
