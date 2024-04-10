provider "aws" {
  profile = "default"
  region     = "eu-west-2"
}

resource "aws_instance" "demo1" {
  ami           = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"

  tags = {
    Name = "made by terraform"
  }
}

locals {
  project_name = "claire"
}

resource "aws_instance" "demo2" {
  ami                         = "ami-0fb391cce7a602d1f"
  instance_type               = "t2.nano"
  key_name = "Key1"
  user_data_replace_on_change = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt-get update -y
        sudo apt install mysql-client -y
        EOF


  tags = {
    Name = "made by terraform!! -${local.project_name}"
  }
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}
