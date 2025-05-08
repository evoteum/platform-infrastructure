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


resource "aws_acm_certificate_validation" "this" {
  certificate_arn = module.aws_certificate.certificate_arn

  validation_record_fqdns = [
    for dvo in values(module.aws_certificate.domain_validation_options) :
    dvo.name
  ]
  depends_on = [
    module.cloudflare_record
  ]
}
