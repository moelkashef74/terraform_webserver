resource "aws_subnet" "public_subnet" {

  count = 2
  cidr_block        = var.pub_cidr_blocks[count.index]
  vpc_id            = aws_vpc.lab_vpc.id
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {

  count = 2
  cidr_block        = var.priv_cidr_blocks[count.index]
  vpc_id            = aws_vpc.lab_vpc.id
  availability_zone = var.azs[count.index]
}