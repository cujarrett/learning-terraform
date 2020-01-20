variable "ami" {
  type = string
  default = "ami-062f7200baf2fa504"
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.web_traffic.name ]

  tags = {
    name = "Public IP Example"
  }
}

resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_eip" "elasticIp" {
  instance = aws_instance.ec2.id
}

output "vpcId" {
  value = aws_eip.elasticIp.public_ip
}
