resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main-vpc.id

  route = [
    {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
    }
  ]
  
  tags = {
    "Name" = "Private route table"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main-vpc.id

  route = [
    {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }
  ]
  
  tags = {
    "Name" = "Public route table"
  }
}

resource "aws_route_table_association" "private-rt-1a" {
  subnet_id      = aws_subnet.private-01a.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private-rt-1b" {
  subnet_id      = aws_subnet.private-01b.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "public-rt-1a" {
  subnet_id      = aws_subnet.public-01a.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-rt-1b" {
  subnet_id      = aws_subnet.public-01b.id
  route_table_id = aws_route_table.public-rt.id
}