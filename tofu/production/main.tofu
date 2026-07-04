terraform {
  required_version = "1.9.0"
  backend "s3" {
    # Values provided by -backend-config in CI
    bucket = ""
    key    = ""
    region = ""
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment   = local.environment
      Project       = var.repository_name
      ManagedBy     = "OpenTofu"
      RepositoryURL = var.repository_url
      RepositoryID  = var.repository_id
    }
  }
}
