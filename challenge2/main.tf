provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}

variable "ingressinput" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egressinput" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_instance" "db_server" {
    ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    tags ={
        Name = "DB_Server"
    }
}

resource "aws_instance" "web_server" {
    ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_sg.name]
    user_data = file("server-script.sh")
    tags ={
        Name = "WebServer"
    }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web_server.id
}



resource "aws_security_group" "web_sg" {
  name = "Allow Web Traffic"
    dynamic "ingress" {
        iterator = port
        for_each = var.ingressinput
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egressinput
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}



output "PrivateIp" {
  value = aws_instance.db_server.private_ip
}


output "PublicIp" {
  value = aws_instance.web_server.public_ip
}

output "EIP" {
  value = aws_eip.web_ip.address
}