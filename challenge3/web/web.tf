

resource "aws_instance" "web_server" {
    ami = "ami-09de362f44ba0a166"
    instance_type = "t2.micro"
    security_groups = [module.mod_sg.sg_name]
    user_data = file("./web/server-script.sh")
    tags ={
        Name = "WebServer"
    }
}




module "mod_sg" {
  source = "../sg"

}

module "mod_eip" {
  source = "../eip"
    instance_id = aws_instance.web_server.id
}


output "PublicIp" {
  value = module.mod_eip.PublicIp
}

