locals {
  network_variables = {
    "${local.environment}_public_subnet_ids" = {
      sensitive = true
      scope     = "organisation"
      name      = "${local.environment}_public_subnet_ids"
      value     = jsonencode(module.aws_networking.public_subnet_ids)
    }
  }

  vpc_attributes = [
    "id",
    "arn",
  ]
  vpc_variables = {
    for attr in local.vpc_attributes :
    "${local.environment}_vpc_${attr}" => {
      sensitive = false
      scope = "organisation"
      name  = "${local.environment}_vpc_${attr}"
      value = module.aws_networking["vpc_${attr}"]
    }
  }


  all_github_variables = merge(
    local.network_variables,
    local.vpc_variables,
  )
}

module "github_variable" {
  source   = "github.com/evoteum/tofu-modules//github/variable"
  for_each = local.all_github_variables

  sensitive = each.value.sensitive
  scope     = each.value.scope
  name      = each.value.name
  value     = each.value.value
}