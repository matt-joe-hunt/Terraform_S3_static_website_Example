provider "aws" {
  region = var.region-master
}

module "Bucket" {
  source      = "./Bucket"
  bucket_name = var.bucket_name
}