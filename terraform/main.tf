provider "aws" {
  region = var.aws_region
}

# Static website bucket
resource "aws_s3_bucket" "static_site" {
  bucket        = "crossy-road-app"
  force_destroy = true
  tags = {
    Name        = "Crossy Road Static Site"
  } 
}



# Website hosting configuration
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.static_site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# Public access block for static site bucket
resource "aws_s3_bucket_public_access_block" "static_site_block" {
  bucket                  = aws_s3_bucket.static_site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


# Static site bucket policy for public read --
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = ["${aws_s3_bucket.static_site.arn}/*"]
      }
    ]
  })
}

