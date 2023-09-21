variable "repositories" {
  description = "Map of github repositories"
  type = map(object({
      visibility = string
      has_issues = bool
      has_discussions = bool
      has_projects = bool
      has_wiki = bool
  }))
}

variable "members" {
  description = "Map of organization members"
  type = map(object({
    role     = string
  }))
}

variable "team_members" {
  description = "Defines which users belongs to a team and its role"
  type = map(list(object({
    username = string
    role = string
  })))
}

variable "teams" {
  description = "Map of organization teams"
  type = map(object({
    description = string
  }))
}

variable "team_repos" {
  description = "Defines team permissions for each repository"
  type = map(list(object({
    name = string
    permission = string
  })))
}
