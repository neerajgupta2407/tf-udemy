variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
   ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags ={
        Name = var.server_names[count.index]
    }
 
}


output "PrivateIps" {
  value = [aws_instance.db.*.private_ip]
}
