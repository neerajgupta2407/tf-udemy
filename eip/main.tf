provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "TerraformVpc"
    }
}

resource "aws_instance" "saleor_ecc2_2" {
    ami = "ami-0bc9ea253d5a2997f"
   instance_type = "t2.micro"
   tags = {
     "Name" = "MyTFSaleorInstance"
   }
}
output "myinstance" {
     value = aws_instance.saleor_ecc2_2.id
}

resource "aws_eip" "elastice_ip" {
  instance = aws_instance.saleor_ecc2_2.id
  tags = {
    "Name" = "TF_IP"
  }
}
output "EIP" {
  value = aws_eip.elastice_ip.public_ip
}