provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  instance_types = {
    dev  = "t2.micro"
    prod = "t3.medium"
  }
  instance_type = lookup(local.instance_types, var.environment, "t2.micro")
}

resource "aws_instance" "Infrasity" {
  ami           = "ami-068e0f1a600cd311c"
  instance_type = local.instance_type
  tags = {
    Name        = "Instance-1"
    Environment = var.environment
  }
}
