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
    s3_buckets = {
      "terraform-state" = {
        "bucket_name" = {
          value       = "terraform_state"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "description" = {
          value       = "AWS S3 Bucket for storing Terraform CE Statefiles"
          description = "Descriptive tag for bucket purpose"
          category    = "terraform"
        },
        "env_name" = {
          value       = "Terraform Demo"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "project_name" = {
          value       = "AWS S3 Bucket for storing Terraform CE Statefiles"
          description = "Descriptive tag for bucket purpose"
          category    = "terraform"
        },
      },
    }
  }
}