variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the infrastructure to."
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "organisation" {
  type        = string
  description = "The name of the organisation."
}

variable "repository_name" {
  type        = string
  description = "The name of this repository."
}

variable "repository_url" {
  type        = string
  description = "The HTML URL of this repository"
}

variable "certificate_arn" {
  description = "the arn of the ssl certificate for this project"
  type        = string
}