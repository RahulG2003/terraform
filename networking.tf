resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "main-subnet" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "main-privatesubnet-ec2" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "main-privatesubnet-rds" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.rds_subnet_cidr_block
  availability_zone = "${var.region}b"
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id
}

resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
}

resource "aws_route_table_association" "main-rt-a" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-public-rt.id
}

resource "aws_eip" "nat-eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main-nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.main-subnet.id
}

resource "aws_route_table" "private-rt-ec2" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-nat-gateway.id
  }
}

resource "aws_route_table_association" "private-subnet-association-ec2" {
  subnet_id      = aws_subnet.main-privatesubnet-ec2.id
  route_table_id = aws_route_table.private-rt-ec2.id
}

resource "aws_route_table" "private-rt-rds" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-nat-gateway.id
  }
}

resource "aws_route_table_association" "private-subnet-association-rds" {
  subnet_id      = aws_subnet.main-privatesubnet-rds.id
  route_table_id = aws_route_table.private-rt-rds.id
}
