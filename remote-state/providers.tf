terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }

backend "s3" {
    bucket = "stateremote"
    key = "remote_state-demo"   
    dynamodb_table = "state-lock"
    region = "us-east-1 "
    }
}

provider "aws"{
    region = "us-east-1"
}

