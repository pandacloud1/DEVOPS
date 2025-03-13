# Define AWS Cloud provider version

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.90.1"
    }
  }
}

# Define AWS Cloud provider
provider "aws" {
  region = "us-east-1"
}
