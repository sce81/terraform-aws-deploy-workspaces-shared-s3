data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
locals {

  secure_s3_repo = [
    {
      identifier                 = "sce81/terraform-aws-s3-root-module"
      github_app_installation_id = data.tfe_github_app_installation.github.id
      branch                     = "main"
    }
  ]

  workspace_vars = {
    base_infra_vars = {
      "terraform_state" = {
        "name" = {
          value       = "terraform_state"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        }
      },
    }
  }
}