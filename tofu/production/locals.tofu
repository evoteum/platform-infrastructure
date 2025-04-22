locals {
  environment = basename(abspath(path.module))
  repositories = yamldecode(data.github_repository_file.repos_yml.content)
}
