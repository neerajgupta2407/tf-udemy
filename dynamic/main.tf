provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


variable "ingressrule" {
  type = list(number)
  default = [ 80,443 ]
  
}
variable "egressrule" {
  type = list(number)
  default = [ 80,443,53,25,8080 ]
  
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
   security_groups = [aws_security_group.my_tf_sg.name]
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

resource "aws_security_group" "my_tf_sg" {
  name = "AllowHttps"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    
  }
  
  dynamic "egress" {
    iterator = port
    for_each = var.egressrule
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    
  }
  

}
