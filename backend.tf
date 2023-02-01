# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_version = "~> 1.0.11"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "PublicSector-ATARC"

    workspaces {
      name = "fse-tf-atarc-virtual-gateway"
    }
  }
}
