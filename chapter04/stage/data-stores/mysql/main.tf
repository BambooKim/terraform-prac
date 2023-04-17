provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    key    = "stage/data-stores/mysql/terraform.tfstate"
    bucket = "terraform-up-and-running-state-bamboo2"

    region = "ap-northeast-2"

    dynamodb_table = "terraform-up-and-running-locks-bamboo2"
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"
  password          = var.db_password
}

