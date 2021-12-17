data "terraform_remote_state" "vnet" {
  backend = "remote"

  config = {
    organization = "PublicSector-ATARC"
    workspaces = {
      name = "fse-tf-atarc-azure-vnet"
    }
  }
}
