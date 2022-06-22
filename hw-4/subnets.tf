### subnets
resource "aws_subnet" "sub-a" {
  vpc_id     = aws_default_vpc.vpc-esmira-default.id
  cidr_block = "172.31.80.0/24"
  availability_zone = data.aws_availability_zones.azs.names[1]

  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "sub-b" {
  vpc_id     = aws_default_vpc.vpc-esmira-default.id
  cidr_block = "172.31.81.0/24"
  availability_zone = data.aws_availability_zones.azs.names[1]

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_default_vpc.vpc-esmira-default.id
  cidr_block = "172.31.87.0/24"
  availability_zone = data.aws_availability_zones.azs.names[1]

  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "sub2" {
  vpc_id     = aws_default_vpc.vpc-esmira-default.id
  cidr_block = "172.31.88.0/24"
  availability_zone = data.aws_availability_zones.azs.names[2]

  tags = {
    Name = "public"
  }
}
