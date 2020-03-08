module "s3" {
  source = "./s3"
  site_name = var.site_name
}

module "cloudfront" {
  source = "./cloudfront"
  s3_origin_bucket = module.s3.s3_origin_bucket
  site_name = var.site_name
  aws_region = var.aws_region
}

output "cloudfront_info" {
  value = module.cloudfront.cloudfront_info.domain_name
}
