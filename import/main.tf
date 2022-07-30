provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}

resource "aws_vpc" "tf-my-vpc" {
    cidr_block = "10.0.0.0/16"
  
}

resource "aws_vpc" "myVpc" {
    cidr_block = "192.168.0.0/24"
  
}
