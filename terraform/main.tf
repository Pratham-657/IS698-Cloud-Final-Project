provider "aws" {
  region = "us-east-1"
}

# --------------------
# VPC
# --------------------
resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "ProjectVPC" }
}

# --------------------
# Subnets
# --------------------
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = { Name = "Public-Subnet-1" }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = { Name = "Public-Subnet-2" }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "Private-Subnet-1" }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "Private-Subnet-2" }
}

# --------------------
# Internet Gateway
# --------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = { Name = "Project-IGW" }
}

# --------------------
# NAT Gateway (needs EIP)
# --------------------
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = { Name = "Project-NAT" }
}

# --------------------
# Route Tables
# --------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

# Route table associations
resource "aws_route_table_association" "rta_public1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rta_public2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rta_private1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rta_private2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

# --------------------
# Security Groups
# --------------------

# Web SG
resource "aws_security_group" "web_sg" {
  name        = "Web-SG"
  description = "Allow HTTP/SSH"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# DB SG
resource "aws_security_group" "db_sg" {
  name        = "DB-SG"
  description = "Allow MySQL from App"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "MySQL Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

