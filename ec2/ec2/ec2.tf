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

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}
