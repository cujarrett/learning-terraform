module "ec2" {
  source = "./ec2"
  ec2_name = "my_ec2_name"
}

output "ec2_details" {
  value = module.ec2.ec2_details
}
