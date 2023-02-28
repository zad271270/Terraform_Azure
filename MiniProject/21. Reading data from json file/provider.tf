terraform {    
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
  client_id = "63985f0b-f02c-4cda-90e2-f8433fba6282"
  client_secret = "sEF8Q~3B-wQDGUMlTH~5j4X1~Mevqgz3EPRUba78"
  features {}  
}
