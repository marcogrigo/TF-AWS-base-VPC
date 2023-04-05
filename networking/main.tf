resource "random_integer" "random" {
  min = 1
  max = 1000
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "BaseVPC-${random_integer.random.id}"
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_cidrs)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name = "private_${count.index + 1}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name = "public_${count.index + 1}"
  }
}