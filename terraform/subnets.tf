resource "aws_subnet" "private-eu-central-1a" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "eu-central-1a"

  tags = {
    "Name"                            = "test-sub-eu-central-1a"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test_cluster"      = "owned"
  }
}

resource "aws_subnet" "private-eu-central-1b" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "eu-central-1a"

  tags = {
    "Name"                            = "test-sub-eu-central-1b"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test_cluster"      = "owned"
  }
}

resource "aws_subnet" "public-eu-central-1a" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "test-sub-eu-central-1b"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test_cluster"      = "owned"
  }
}

resource "aws_subnet" "public-eu-central-1b" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "test-sub-eu-central-1b"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test_cluster"      = "owned"
  }
}