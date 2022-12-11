resource "aws_vpc" "wp_vpc" {
  cidr_block           = local.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "${var.project_code}-vpc"
  }
}

resource "aws_subnet" "public_1_subnet" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = local.public_subnet_1_cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.project_code}-public-1"
  }

}

resource "aws_subnet" "public_2_subnet" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = local.public_subnet_2_cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.project_code}-public-2"
  }
}

resource "aws_subnet" "public_3_subnet" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = local.public_subnet_3_cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.project_code}-public-3"
  }
}

resource "aws_subnet" "private_1_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = local.private_subnet_1_cidr

  tags = {
    "Name" = "${var.project_code}-private-1"
  }
}

resource "aws_subnet" "private_2_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = local.private_subnet_2_cidr

  tags = {
    "Name" = "${var.project_code}-private-2"
  }
}

resource "aws_subnet" "private_3_subnet" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = local.private_subnet_3_cidr

  tags = {
    "Name" = "${var.project_code}-private-3"
  }
}

resource "aws_route_table" "wp_vpc_route_table" {
  vpc_id = aws_vpc.wp_vpc.id

  tags = local.tags
}

resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = aws_vpc.wp_vpc.id
  tags   = local.tags
}

resource "aws_security_group" "public_sg" {
  name        = "${var.project_code}-public-sg"
  description = "Allow Public Access"
  vpc_id      = aws_vpc.wp_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.wp_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
