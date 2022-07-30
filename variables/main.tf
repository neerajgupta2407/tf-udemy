provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "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"
}


variable "myvpc" {
  type = string
  default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
  
}

variable "myList" {
    type = list(string)
    default = [ "value1","value2", ]
  
}

variable "mymap" {
    type = map
    default = {
        key1="value1"
        key2="value2"
    }
  
}
variable "inputname" {
  type = string
  description = "set the name of VPC"
}

resource "aws_vpc" "tf-my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = var.inputname
    }
  
}


output "vpc_id" {
  value = aws_vpc.tf-my-vpc.id
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = [
    "value" , 1, "value"
    ]
  
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
      name = "NEER"
      port = [ 22,25,80]
    }
}