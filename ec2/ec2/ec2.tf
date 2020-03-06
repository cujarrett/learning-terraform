variable "ec2_name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  tags = {
    name = var.ec2_name
  }
}

output "ec2_details" {
  value = aws_instance.ec2
}
