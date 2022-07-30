provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


resource "aws_db_instance" "myDb" {
  db_name = "TFRds"
  identifier = "my-firts-rds"
  instance_class = "db.t2.micro"
  engine = "postgres"
  engine_version = "12.8"
  username = "neeraj"
  password = "neeraj123"
  port = 5432
  allocated_storage=20
  skip_final_snapshot = true
}