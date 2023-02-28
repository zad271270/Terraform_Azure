terraform {
   cloud {
    organization = "techsup4000-prod"

    workspaces {
      name = "workspace-dev"
    }
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "6912d7a0-bc28-459a-9407-33bbba641c07"
  tenant_id = "70c0f6d9-7f3b-4425-a6b6-09b47643ec58"
  client_id = "d247a470-217b-44ae-b35c-8605a63dfe5c"
  client_secret = "VBf8Q~MGhPD1LZA0LyiAZdPm0F5mt~mIqT8MBbJq"
  features {}  
}