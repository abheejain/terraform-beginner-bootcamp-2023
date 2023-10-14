variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}


# variable "thaifood_public_path" {
#   type = string
# }

# variable "thaiband_public_path" {
#   type = string
# }


# variable "content_version" {
#   type        = number
# }

variable "thaifood" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "thaiband" {
  type = object({
    public_path = string
    content_version = number
  })
}

# variable "bucket_name" {
#   type        = string
# }

# variable "index_html_filepath" {
#   type = string
# }

# variable "error_html_filepath" {
#   type = string
# }



# variable "assets_path" {
#   type = string
# }