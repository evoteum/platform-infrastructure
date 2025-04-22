module "aws_networking" {
  source       = "github.com/evoteum/tofu-modules//aws/networking"
  environment  = local.environment
  project_name = var.repository_name
}
