provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}


output "PrivateIp" {
  value =  module.db.PrivateIP
}


output "PublicIp" {
  value = module.web.PublicIp
}
