terraform {
#remember to enable version in PROD for statefile backup
#create state file in s3, no version eneble right now
backend "s3" {
    bucket         = "project1-exampleapp"
    key            = "appserver/terraform.tf"
    region         = "eu-north-1"
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
   region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
#  ami           = "ami-0da4b082c0455e0a0"
  count     	 = 3
  ami           = "ami-0f174d97d7d7a029b"
  instance_type = var.instance_type

  tags = {
     server = "ExampleAppServerInstance"
     Name= "${var.instance_name}-${count.index + 1}"
  }
}


