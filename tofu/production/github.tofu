locals {
  alb_variable = {
    sensitive = false,
    scope = "organisation",
    name = "production_alb_dns_name",
    value = module.aws_load_balancer.dns_name
  }

  all_github_variables = merge(
    local.alb_variable,
  )
}

module "github_variable" {
  source   = "github.com/evoteum/tofu-modules//github/variable"
  for_each = local.all_github_variables
  depends_on = [
    module.quay_repository
  ]

  sensitive = each.value.sensitive
  scope     = each.value.scope
  name      = each.value.name
  value     = each.value.value
}