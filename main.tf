terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

# Create a VPC
resource "aws_vpc" "Hezi_VPC" {
  cidr_block = "192.10.0.0/16"
  tags = {
    "Name":"hezi_vpc"
  }
}

resource "aws_subnet" "Web" {
  cidr_block = "192.10.0.0/27"
  vpc_id = aws_vpc.Hezi_VPC.id
  tags = {
    "Name":"hezi_web"
  }
}


resource "aws_subnet" "App" {
  cidr_block = "192.10.0.32/27"
  vpc_id = aws_vpc.Hezi_VPC.id
  tags = {
    "Name":"hezi_app"
  }
}


resource "aws_subnet" "DB" {
  cidr_block = "192.10.0.64/28"
  vpc_id = aws_vpc.Hezi_VPC.id
  tags = {
    "Name":"hezi_db"
  }
}