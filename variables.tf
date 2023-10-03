variable "organization" {
  default     = "HashiCorp_TFC_Automation_Demo"
  type        = string
  description = "workspace to deploy to"
}

variable "github_installation_id" {
  type        = string
  description = "VCS installation ID to access repo"
  default     = null
}

variable "automation_git_branch" {
  type        = string
  description = "branch of repo to pull from VCS"
  default     = "main"
}

variable "sentinel_policies" {
  type        = list(string)
  description = "Additional Sentinel Policies to be added to environment"
  default     = []
}