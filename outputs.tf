output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.home_thaifood_hosting.bucket_name
}

output "s3_website_endpoint" {
  description= "ENdpoint for our static website hosting"
  value = module.home_thaifood_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.home_thaifood_hosting.domain_name
}