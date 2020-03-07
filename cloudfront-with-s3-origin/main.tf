module "s3" {
  source = "./s3"
  site_name = var.site_name
}

module "cloudfront" {
  source = "./cloudfront"
  aws_s3_origin_bucket = module.s3.aws_s3_origin_bucket
  site_name = var.site_name
  aws_region = var.aws_region
}

output "aws_cloudfront_info" {
  value = module.cloudfront.aws_cloudfront_info.domain_name
}
