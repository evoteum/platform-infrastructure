module "aws_networking" {
  source       = "github.com/evoteum/tofu-modules//aws/networking"
  environment  = local.environment
  project_name = var.repository_name
  project_id   = var.repository_id
}

module "aws_certificate" {
  source = "github.com/evoteum/tofu-modules//aws/certificate"

  domain_name = var.homepage_url
}

