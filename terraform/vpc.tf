resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }

  lifecycle {
    prevent_destroy = true
  }
}



resource "aws_default_subnet" "public_subnet1" {
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "subnet1"
  }
}



resource "aws_default_subnet" "public_subnet2" {
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "subnet2"
  }
}



resource "aws_default_subnet" "default_az3" {
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "subnet3"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_default_vpc.default.id

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "main"
  }
}
