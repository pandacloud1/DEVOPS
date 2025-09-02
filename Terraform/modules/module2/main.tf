provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source       = "./modules/vpc"
}

module "ec2" {
  source         = "./modules/ec2"
}

module "s3" {
  source      = "./modules/s3"
}
