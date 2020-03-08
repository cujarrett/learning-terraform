variable "site_name" {
  type = string
  description = "Site name"
}

resource "aws_s3_bucket" "origin" {
  bucket = var.site_name
  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = var.site_name
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT","POST"]
    allowed_origins = ["*"]
    expose_headers = ["ETag"]
    max_age_seconds = 3000
  }

  force_destroy = true

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.site_name}/*"
    }
  ]
}
EOF
}

output "s3_origin_bucket" {
  value = aws_s3_bucket.origin
}
