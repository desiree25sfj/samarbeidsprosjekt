terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.58.0"
    }
  }

  # Store the state in a remote backend
  backend "s3" {
    bucket = "sandefjord-students"
    key    = "samarbeidsprosjekt/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

variable "hcloud_token" {
  description = "The token for managing resources on Hetzner Cloud"
  sensitive   = true
}

provider "hcloud" {
  token = var.hcloud_token
}
