provider "github" {
  #token="https://github.com/settings/tokens"
  token = "FILL your token"
}


resource "github_repository" "terraform-repo" {
  name        = "terraform-example-repo"
  description = "This repository contents terraform examples"
  visibility  = "private"
  auto_init   = true
}

resource "github_branch" "development" {
  repository = github_repository.terraform-repo.name
  branch     = "development"
}

resource "github_branch" "release" {
 repository = github_repository.terraform-repo.name
  branch     = "release"
}

# Github , AWS, Google Clouse , Docker Desktop , 