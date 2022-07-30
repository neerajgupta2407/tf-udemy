provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


module "ec2module" {
  source = "./ec2"
  ec2name = "NameFromModule"
  
}

output "module_output" {
  value = module.ec2module.instance_id
}