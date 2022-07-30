variable "ingressinput" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egressinput" {
  type = list(number)
  default = [ 80,443 ]
}


output "sg_name" {
  value = aws_security_group.web_sg.name
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
