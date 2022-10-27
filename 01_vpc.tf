resource "aws_vpc" "wp_vpc" {
  cidr_block           = "10.10.10.0/24"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Project = var.project_name
  }

}

resource "aws_subnet" "public_1_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = "10.10.10.0/25"

  tags = {
    Project = var.project_name
  }
}

resource "aws_subnet" "private_1_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = "10.10.10.128/25"

  tags = {
    Project = var.project_name
  }
}

resource "aws_route_table" "wp_vpc_route_table" {
  vpc_id = aws_vpc.wp_vpc.id

  tags = {
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = aws_vpc.wp_vpc.id

}
