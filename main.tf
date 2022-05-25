provider "aws" {
  region = "us-east-1"

}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    "Name" = "workout_vpc"
  }

}

resource "aws_public_subnet " "public-subnet" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = "10.0.1.0/24"
  availability_zone      = "us-east-1a"
  map_public_ip_on_lunch = true

  tags = {
    Name = "workout_public_subnet"
  }
}

resource "aws_private_subnet " "private-subnet" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = "10.0.2.0/24"
  availability_zone      = "us-east-1b"
  map_public_ip_on_lunch = false

  tags = {
    Name = "workout_private_subnet"
  }
}