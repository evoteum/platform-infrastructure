module "aws_ecs_cluster" {
  source      = "github.com/evoteum/tofu-modules//aws/ecs_cluster"
  environment = local.environment
  project_name = var.repository_name
}
