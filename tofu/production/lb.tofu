module "aws_load_balancer" {
  source          = "github.com/evoteum/tofu-modules//aws/load_balancer"
  environment     = local.environment
  project_name    = var.repository_name
  subnet_ids      = module.aws_networking.public_subnet_ids
  certificate_arn = module.aws_certificate.certificate_arn
  vpc_id          = module.aws_networking.vpc_id
  project_id      = var.repository_id
}
