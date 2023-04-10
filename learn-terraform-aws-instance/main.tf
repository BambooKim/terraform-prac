terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e52aed83baf3e36a"
  instance_type = "t2.micro"

  tags = {
    # Name = "ExampleAppServerInstance"
    Name = var.instance_name
  }
}