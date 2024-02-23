terraform {

  # cloud {
  #   organization = "**********"
  #   workspaces {
  #     name = "********"
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

module "ec2_instance" {
  source = "./modules/aws-ec2-instance"
  instance_name = "my-hotel-server"
}

module "db" {
  source = "./modules/aws-rds"
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "my-hotel-client"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

