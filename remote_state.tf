# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

data "terraform_remote_state" "vnet" {
  backend = "remote"

  config = {
    organization = "PublicSector-ATARC"
    workspaces = {
      name = "fse-tf-atarc-azure-vnet"
    }
  }
}
