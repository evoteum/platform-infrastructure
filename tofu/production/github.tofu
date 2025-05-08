locals {
  alb_variables = {
    "${local.environment}_alb_dns_name" = {
      sensitive = false
      scope     = "organisation"
      name      = "${local.environment}_alb_dns_name"
      value     = module.aws_load_balancer.dns_name
    },
    "${local.environment}_alb_https_listener_arn" = {
      sensitive = false
      scope     = "organisation"
      name      = "${local.environment}_alb_https_listener_arn"
      value     = module.aws_load_balancer.https_listener_arn
    },
    "${local.environment}_alb_security_group_id" = {
      sensitive = true
      scope     = "organisation"
      name      = "${local.environment}_alb_security_group_id"
      value     = module.aws_load_balancer.security_group_id
    }
  }

  ecs_variables = {
    "${local.environment}_ecs_cluster_arn" = {
      sensitive = true
      scope     = "organisation"
      name      = "${local.environment}_ecs_cluster_arn"
      value     = module.aws_ecs_cluster.cluster_arn
    }
  }

  vpc_attributes = [
    "id",
    "arn",
  ]
  vpc_variables = {
    for attr in local.vpc_attributes :
    "${local.environment}_vpc_${attr}" => {
      sensitive = true
      scope = "organisation"
      name  = "${local.environment}_vpc_${attr}"
      value = lookup(module.aws_networking, "vpc_${attr}")
    }
  }


  all_github_variables = merge(
    local.alb_variables,
    local.ecs_variables,
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