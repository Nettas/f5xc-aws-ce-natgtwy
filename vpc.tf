resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "nat_gtwy_vpc"
  }
}

resource "aws_subnet" "instance" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.vpc.id
  tags = {
    "Name" = "SubnetInstance"
  }
}