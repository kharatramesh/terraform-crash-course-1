terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  access_key = var.akey
  secret_key = var.skey
  region     = var.location
}


resource "aws_s3_bucket" "b1" {
  bucket = "tc-bucket1-030824"

}

resource "aws_instance" "vm1" {
  count =2 
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.nano"
  tags = {
    "Name" = "${tc-vm1}-${count.index}"
  }
}
  
terraform {
  cloud {
    organization = "priar"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["samosa"]
    }
  }
}
