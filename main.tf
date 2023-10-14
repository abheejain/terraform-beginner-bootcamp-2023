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
  cloud {
   organization = "Equinox9"
   workspaces {
     name = "terra-house-1"
   }
  }
}

provider "terratowns" {
  endpoint=var.terratowns_endpoint
  user_uuid=var.teacherseat_user_uuid // Your account uuid
  token=var.terratowns_access_token // get from the platform 
}

#host - 01
module "home_thaifood_hosting" {
 source = "./modules/terrahome_aws"
 user_uuid= var.teacherseat_user_uuid
 public_path = var.thaifood.public_path
 #index_html_filepath = var.index_html_filepath
 #error_html_filepath = var.error_html_filepath
 content_version = var.thaifood.content_version
 #assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Thai Vegetarian Food, Aroi "
  description = <<DESCRIPTION
Thai vegetarian food is a delightful and aromatic cuisine rich in flavors, utilizing ingredients like tofu, vegetables, coconut milk, and Thai spices. Dishes such as Pad Thai, Green Curry, and Som Tum (Green Papaya Salad) are popular options for vegetarians.
DESCRIPTION
  domain_name = module.home_thaifood_hosting.domain_name
  #domain_name = "3hdq32dgz.cloudfront.net" // change this if you get error in 'resource'
  town = "missingo"
  content_version = var.thaifood.content_version
}


#Host - 02 
module "home_thaiband_hosting" {
 source = "./modules/terrahome_aws"
 user_uuid= var.teacherseat_user_uuid
 public_path = var.thaiband.public_path
 #index_html_filepath = var.index_html_filepath
 #error_html_filepath = var.error_html_filepath
 content_version = var.thaiband.content_version
 #assets_path = var.assets_path
}

resource "terratowns_home" "home_thaiband" {
  name = "Roman Anton Band"
  description = <<DESCRIPTION
Roman Anton brings you art, books, music, and related creations through this one-of-a-kind website. All the creations are originals made by Roman Anton.  The Roman Anton Team invites you to take a look at the many offerings inside
DESCRIPTION
  domain_name = module.home_thaiband_hosting.domain_name
  #domain_name = "3hdq32dgz.cloudfront.net" // change this if you get error in 'resource'
  town = "melomaniac-mansion"
  content_version = var.thaiband.content_version
}