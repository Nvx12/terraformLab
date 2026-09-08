terraform {
  cloud {
    organization = "terraform-workshop-1"

    workspaces {
      name = "terraform-prod"
    }
  }
}