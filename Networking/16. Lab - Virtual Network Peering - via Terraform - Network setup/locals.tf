locals {
  resource_group_name="app-grp"
  location="North Europe"
  environment = {
    staging="10.0.0.0/16"
    test="10.1.0.0/16"
    }
}