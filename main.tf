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

terraform {
  cloud {
    organization = "priar"
    workspaces {
      name = "terraform-crash-course-1"
    }
  }
}

resource "aws_s3_bucket" "b1" {
  bucket = "tc-bucket1-030824"

}

resource "aws_instance" "vm1" {
  count =1 
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.nano"
  tags = {
    "Name" = "${tc-vm1}-${count.index}"
  }
}
  
