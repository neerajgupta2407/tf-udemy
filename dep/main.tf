provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}

resource "aws_instance" "db" {
   ami = "ami-09de362f44ba0a166"
instance_type = "t2.micro"
tags ={
    Name = "DB_Server"
}
}

resource "aws_instance" "web" {
   ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    tags ={
        Name = "WebServer"
    }
    depends_on = [
      aws_instance.db
    ]
}

data "aws_instance" "db_search" {
  filter {
    name = "tag:Name"
    values = ["DB_Server"]
  }
}
output "dbserver_az" {
  value = data.aws_instance.db_search.availability_zone
}
output "dbserver_ami" {
  value = data.aws_instance.db_search.ami
}