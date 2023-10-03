resource "tfe_project" "shared_services" {
  organization = "HashiCorp_TFC_Automation_Demo"
  name         = "shared_services"
}
module "TFC_Workspace_S3_Buckets" {
  for_each                      = local.workspace_vars.s3_buckets
  source                        = "app.terraform.io/HashiCorp_TFC_Automation_Demo/workspace-management/tfe"
  version                       = "2.0.9"
  name                          = "aws_workspace_s3_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.secure_s3_repo
  tfe_variables                 = each.value
  project_id                    = tfe_project.shared_services.name
  structured_run_output_enabled = "false"
  workspace_tags                = [each.key, "aws", "s3", "deployment", "platform", "shared-services"]
  sentinel_policy               = flatten(["Require-Resources-from-PMR", "Enforce-Tagging-Policy", var.sentinel_policies])
  auto_apply                    = true
  depends_on = [
    tfe_project.shared_services
  ]
}

//module "TFC_Workspace_IAM_Roles" {
//  for_each                      = local.workspace_vars.iam_roles
//  source                        = "app.terraform.io/HashiCorp_TFC_Automation_Demo/workspace-management/tfe"
//  version                       = "2.0.9"
//  name                          = "aws_workspace_s3_${each.key}"
//  organization                  = data.tfe_organization.main.name
//  vcs_repo                      = local.kubernetes_deployment_repo
//  tfe_variables                 = local.common_deployments
//  project_id                    = data.tfe_project.shared_services.id
//  structured_run_output_enabled = "false"
//  workspace_tags                = [each.key, "aws", "iam", "deployment", "platform","shared-services"]
//}