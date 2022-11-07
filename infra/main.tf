terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8.0"
    }
  }

  backend "s3" {
    bucket = "kc-terraform-backend"
    key    = "backend"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "kc_acme_storage" {
  bucket = "${var.bucket}-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}
