resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "public-subnet"
  }
}
