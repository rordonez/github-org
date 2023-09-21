# Github Organization
This exercise create github users, repositories and teams for a Github organization

## Basic setup and configuration
This repository uses terraform to manage Github configurations as code using 
[Terraform github provider](https://registry.terraform.io/providers/integrations/github/latest/docs).
This provider has been configured using a preconfigured Github Personal Access Token as specified in 
[documentation](https://registry.terraform.io/providers/integrations/github/latest/docs#oauth--personal-access-token).
[versions.tf file](versions.tf) contains terraform backend block. `GITHUB_TOKEN` and `GITHUB_OWNER` must be set
in order to call terraform commands. For production code, an alternative centralised identity server should be
configured.

## Implementation details
Implementation uses variables to define `repositories`, `members` and `teams`. In addition to these, two more variables
have been added to define team-members and team-repos associations. They could have been defined as part of `teams`
variable object but for simplicity I have decided to define them separately. I have made this assumption in order to
define them using files in `json` or `csv` format.

I have added some [outputs](outputs.tf) in order to be accessible to other modules.

Further iterations can be done on this repository like creating a Terraform module or using different variables per
environment. Also there is no logic to define the Terraform backend on AWS using an S3 bucker and encrypt it to protect
any sensitive data. Validations for inputs can be added as well to protect from unwanted values. 
