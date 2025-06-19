terraform {
#remember to enable version in PROD for statefile backup
#create state file in s3, no version eneble right now
backend "s3" {
    bucket         = "terraform-store-state"
    key            = "appserver/terraform.tf"
    region         = "ap-southeast-2"
    encrypt        = true
#    dynamodb_table = "your-dynamodb-table-name"  # Optional, for state locking
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
#  region  = "us-west-2"
   region  = "ap-southeast-2"
}

resource "aws_instance" "app_server" {
#  ami           = "ami-0da4b082c0455e0a0"
  count     	 = 3
  ami           = "ami-00543daa0ad4d3ea4"
  instance_type = var.instance_type

  tags = {
     server = "ExampleAppServerInstance"
     Name= "${var.instance_name}-${count.index + 1}"
  }
}


