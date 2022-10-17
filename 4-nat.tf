resource "aws-eip" "nat-eip" {
    vpc = true

    tags = {
        Name= "nat-eip"
    }
}
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-01a.id

  tags = {
    Name = "nat-gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw.id]
}