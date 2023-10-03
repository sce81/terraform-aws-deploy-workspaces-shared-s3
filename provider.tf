terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "terraform-aws-deploy-workspaces-shared-services"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.48.0"
      source  = "hashicorp/tfe"
    }
  }
}