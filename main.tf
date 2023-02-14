provider "aws" {
  region = "us-east-1"
}
variable "cidr_block" {
  description = "cidr block for vpc and subnets"
  type = list(string)
}
variable "environment" {
  description = "deployment environment"
}
resource "aws_vpc" "development-vpc" {
  
  cidr_block = var.cidr_block[0]
  tags = {
  Name = var.environment
   
  }
  
}
resource "aws_subnet" "dev-subnet1" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = var.cidr_block[1]
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-1-dev"
  }
}


