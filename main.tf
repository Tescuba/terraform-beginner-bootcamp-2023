terraform {
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "ExamPro0923"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  # cloud {
  #   organization = "Exmpro0923"
  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
