terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "Equinox9"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
}

provider "terratowns" {
  endpoint=var.terratowns_endpoint
  user_uuid=var.teacherseat_user_uuid // Your account uuid
  token=var.terratowns_access_token // get from the platform 
}

module "terrahouse_aws" {
 source = "./modules/terrahouse_aws"
 user_uuid= var.teacherseat_user_uuid
 //bucket_name = var.bucket_name // Removed to get random bucket name
 index_html_filepath = var.index_html_filepath
 error_html_filepath = var.error_html_filepath
 content_version = var.content_version
 assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Thai Vegetarian Food, Aroi "
  description = <<DESCRIPTION
Thai vegetarian food is a delightful and aromatic cuisine rich in flavors, utilizing ingredients like tofu, vegetables, coconut milk, and Thai spices. Dishes such as Pad Thai, Green Curry, and Som Tum (Green Papaya Salad) are popular options for vegetarians.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3hdq32dgz.cloudfront.net" // change this if you get error in 'resource'
  town = "missingo"
  content_version = 1
}