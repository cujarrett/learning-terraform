module "rds" {
  source = "./rds"
  rds_username = var.rds_username
  rds_password = var.rds_password
}

output "rds_address" {
  value = module.rds.rds_address
}
