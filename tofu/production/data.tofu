data "github_repository_file" "repos_yml" {
  repository          = "estate-repos"
  branch              = "main"
  file                = "repos.yml"
}