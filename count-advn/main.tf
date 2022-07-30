provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}



module "db" {
  source = "./db"
  server_names = ["A","B","C"]
}

output "PrivateIp" {
  value = module.db.PrivateIps
}