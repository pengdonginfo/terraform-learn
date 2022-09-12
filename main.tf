provider "aws" {
  region = "ap-southeast-2"
}

variable "subnet_cider_block" {
  description = "subnet cidr block" 
  default = "10.0.10.0/24" 
  type = string
}

variable "vpc_cider_block" {
  description = "vpc cidr block"  
}

variable "environment" {
  description = "choose different environment"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cider_block
  tags = {
    Name: var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cider_block
  availability_zone = "ap-southeast-2a"
  tags = {
    Name: "subnet-1-dev"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}


#"10.0.10.0/24"