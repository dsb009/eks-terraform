resource "aws_subnet" "private-01a" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.main-vpc.id
    availability_zone = "us-east-1a"

    tags = {
      "Name" = "private-01a"
      //https://aws.amazon.com/premiumsupport/knowledge-center/eks-vpc-subnet-discovery/
      "kubernetes.io/role/internal-elb" = "1"
      //required for kubernetes to discover this subnet
      "kubernetes.io/cluster/demo" = "owned"
      //owned is used becacuse it is used of for a single EKS cluster with name demo
    }
  
}
resource "aws_subnet" "private-02b" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.main-vpc.id
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "private-02b"
    "kubernetes.io/role/internal-elb" ="1"
    "kubernetes.io/cluster/demo" ="owned"
  }
  
}
resource "aws_subnet" "public-01a" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.main-vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch= true

  tags = {
    "Name" = "public-01a"
    "kubernetes.io/role/elb" ="1"
    "kubernetes.io/cluster/demo" ="owned"
  } 
}
resource "aws_subnet" "public-02b" {
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.main-vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch= true

  tags = {
    "Name" = "public-02b"
    "kubernetes.io/role/elb" ="1"
    "kubernetes.io/cluster/demo" ="owned"
  }
  
}