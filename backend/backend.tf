terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "neeraj-tf-bucket"
    region = "ap-south-1"
    access_key = "AKIA5OSIP2ICSBRIZDFW"
    secret_key = "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"
  }
}