repositories = {
  voxsmart-service-api = {
    visibility = "private"
    has_issues = false
    has_discussions = false
    has_projects = false
    has_wiki = false
  }
  voxsmart-service-ui = {
    visibility = "private"
    has_issues = false
    has_discussions = false
    has_projects = false
    has_wiki = false
  }
  voxsmart-service-sdk = {
    visibility = "public"
    has_issues = false
    has_discussions = false
    has_projects = false
    has_wiki = false
  }
}

teams = {
  Backend = {
    description = "Backend team"
  }
  Frontend = {
    description = "Frontend team"
  }
}

team_members = {
  Backend = [
    {
      username = "user1"
      role = "member"
    },
    {
      username = "user2"
      role = "member"
    }
  ]
  Frontend = [
    {
      username = "user2"
      role = "member"
    }
  ]
}

members = {
  user1 = {
    role = "member"
  }
  user2 = {
    role = "member"
  }
}

team_repos = {
  Backend = [
    {
      name = "voxsmart-service-api"
      permission = "admin"
    },
    {
      name = "voxsmart-service-sdk"
      permission = "push"
    }
  ]
  Frontend = [
    {
      name = "voxsmart-service-api"
      permission = "pull"
    },
    {
      name = "voxsmart-service-ui"
      permission = "admin"
    },
    {
      name = "voxsmart-service-sdk"
      permission = "push"
    }
  ]
}