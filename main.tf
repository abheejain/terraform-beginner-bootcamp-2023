terraform {
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

module "terrahouse" {
    source = "./modules/terrahouse_aws"
    user_uuid= var.user_uuid
    bucket_name = var.bucket_name
}