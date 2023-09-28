provider "random" {
}

resource "random_string" "sa_name_affix" {
  length  = 8
  special = false
  upper   = false
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "trekgroup" {
  name     = "trekgroup-resources"
  location = "West US"
  tags = {
    yor_name             = "trekgroup"
    yor_trace            = "0692662f-565d-4739-81b7-53829f02692d"
    git_commit           = "066fceaafe8ffb9b43d8ae6eb14501ae0deaa30a"
    git_file             = "terraform/simple_instance/storage.tf"
    git_last_modified_at = "2023-09-28 18:38:39"
    git_last_modified_by = "srikanth.makineni@gmail.com"
    git_modifiers        = "srikanth.makineni"
    git_org              = "itgeeksroom"
    git_repo             = "terragoat-bridgecrew"
  }
}

resource "azurerm_storage_account" "storagebay" {
  name                     = "storagebay${random_string.sa_name_affix.result}"
  resource_group_name      = azurerm_resource_group.trekgroup.name
  location                 = azurerm_resource_group.trekgroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_name             = "storagebay"
    yor_trace            = "425c9f46-55c0-48b9-9d85-ccedddc68779"
    git_commit           = "066fceaafe8ffb9b43d8ae6eb14501ae0deaa30a"
    git_file             = "terraform/simple_instance/storage.tf"
    git_last_modified_at = "2023-09-28 18:38:39"
    git_last_modified_by = "srikanth.makineni@gmail.com"
    git_modifiers        = "srikanth.makineni"
    git_org              = "itgeeksroom"
    git_repo             = "terragoat-bridgecrew"
  }
}
