module "ec2" {
  source = "./ec2"
  ec2_name = "my_ec2_name"
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_private_ip" {
  value = module.ec2.private_ip
}
