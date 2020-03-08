module "vpc" {
  source = "./vpc"
}

output "vpc_details" {
  value = module.vpc.vpc_details
}