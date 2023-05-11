# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
    COSTCENTER = ""
    MANAGED = "modec"
    ENTITY = "mii"
    APPLICATION	= ""
    CONTACT-INFRA	= ""
    DESCRIPTION	= ""
    PROJECT	= "ies-infra"
    FUNCTION = ""
    LANDSCAPE = "sandbox"
    BACKUPPLAN = "none"
    CONTACT-APP = ""
    SITE = "use"



  }
}
