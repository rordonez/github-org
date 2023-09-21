resource "github_membership" "admin_user" {
  username = "rordonez"
  role     = "admin"
}

resource "github_repository" "all" {
  for_each = var.repositories
  name        = each.key

  visibility = each.value.visibility
  has_issues = each.value.has_issues
  has_discussions = each.value.has_discussions
  has_projects = each.value.has_projects
  has_wiki = each.value.has_wiki
}

resource "github_membership" "all" {
  for_each = var.members

  username = each.key
  role     = each.value.role
}


resource "github_team" "all" {
  for_each = var.teams
  name                      = each.key
  description               = each.value.description
  create_default_maintainer = true
}

locals {

  team_members = flatten([
    for team, members in var.team_members: [
      for member in members : {
        team_id  = github_team.all[team].id
        name = "${team}:${member.username}"
        username = member.username
        role     = member.role
      }
    ]
  ])
  team_repositories = flatten([
    for team, repositories in var.team_repos: [
      for repository in repositories : {
        team_id  = github_team.all[team].id
        name = "${team}:${repository.name}"
        repository = repository.name
        permission = repository.permission
      }
    ]
  ])
}

resource "github_team_membership" "all" {
  for_each = {
    for k in local.team_members : k.name => k
  }

  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role
}

resource "github_team_repository" "all" {
  for_each = {
    for k in local.team_repositories: k.name => k
  }
  team_id    = each.value.team_id
  repository = each.value.repository
  permission = each.value.permission
}

