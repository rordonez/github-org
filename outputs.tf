output "repositories" {
  value = {
    for k, v in github_repository.all : k => v.repo_id
  }
}

output "teams" {
  value = {
    for k, v in github_team.all : k => v.id
  }
}

output "members" {
  value = {
    for k, v in github_membership.all : k => {
      id   = v.id
      role = v.role
    }
  }
}

output "team_members" {
  value = github_team_membership.all
}

output "team_repos" {
  value = github_team_repository.all
}
