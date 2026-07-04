variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the infrastructure to."
}

variable "repository_name" {
  type        = string
  description = "The name of this repository."
}

variable "repository_url" {
  type        = string
  description = "The HTML URL of this repository"
}

variable "repository_id" {
  type        = string
  description = "The GitHub API ID of this repository."
}
