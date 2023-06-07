provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAYBSZ6FIYIMBPQ3HT"
  secret_key ="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"
}

terraform {
  backend "s3" {
    bucket         = "realmext"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}

resource "aws_instance" "PROD" {
  ami           = "ami-0607784b46cbe5816"
  instance_type = "t2.micro"

   provisioner "file" {
    source        = "c:/users/nouma/test.pem"
    destination   = "root@ip=172-31-10-1 terraform"
}

  tags = {
    Name = "Terra"
  }
}

Variable "Moha" {
  description = "Name of the S3 bucket"
  type        = string
}

resource "aws_s3_bucket" "example" {
  bucket = var.Moha
  acl    = "private"

  tags = {
    Name        = var.Moha
    Environment = "Production"
  }
}

