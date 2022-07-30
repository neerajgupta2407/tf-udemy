provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


resource "aws_instance" "web" {
   ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    tags ={
        Name = "WebServer"
    }
    count = 3
 
}

