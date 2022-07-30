


resource "aws_instance" "db_server" {
    ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    tags ={
        Name = "DB_Server"
    }
}

output "PrivateIP" {
 value =  aws_instance.db_server.private_ip
}