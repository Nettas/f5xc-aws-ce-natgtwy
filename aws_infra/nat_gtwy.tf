resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.nat_gateway.id
  tags = {
    "Owner" = "s.iannetta@f5.com"
  }
}

resource "aws_route_table" "instance" {
  vpc_id = aws_vpc.vpc.id
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.nat_gateway.id
  # }
}

resource "aws_route_table_association" "instance" {
  subnet_id      = aws_subnet.securityServicesSubnetOutsideAZ1.id
  route_table_id = aws_route_table.instance.id
}
