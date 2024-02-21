terraform {

  # cloud {
  #   organization = "organisation-name"
  #   workspaces {
  #     name = "workspace-name"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e5f882be1900e43b"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "appolin-terraform-s3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

