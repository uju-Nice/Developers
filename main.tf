# creating prod cloud networknhouse

resource "aws_vpc" "prod-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod public subnet1

resource "aws_subnet" "prod-public-subnet1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod public subnet2
resource "aws_subnet" "prod-pub-subnet2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.110.0/24"

  tags = {
    Name = "dev-environment"
  }
}


# prod public route table

resource "aws_route_table" "prod-public-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "dev-environment"
  }
}

# associating prod public route table to prod public subnet1
resource "aws_route_table_association" "associate-with-prod-pub-subnet1" {
  subnet_id      = aws_subnet.prod-public-subnet1.id
  route_table_id = aws_route_table.prod-public-route-table.id
}

  #associating prod public route table to prod public subnet2
resource "aws_route_table_association" "associate-with-pub-subnet2" {
  subnet_id      = aws_subnet.prod-pub-subnet2.id
  route_table_id = aws_route_table.prod-public-route-table.id
}


# this is prod private subnet1
resource "aws_subnet" "prod-private-subnet1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.120.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod private subnet2
resource "aws_subnet" "prod-private-subnet2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.130.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# prod private route table
resource "aws_route_table" "prod-private-route-table" {
  vpc_id = aws_vpc.prod-vpc.id


  tags = {
    Name = "dev-environment"
  }
}

#asociating prod private route table to prod private subnet1
resource "aws_route_table_association" "associate-with-private-subnet1" {
  subnet_id      = aws_subnet.prod-private-subnet1.id
  route_table_id = aws_route_table.prod-private-route-table.id
}

#associating prod private route table to prod private subnet2
resource "aws_route_table_association" "associate-with-private-subnet2" {
  subnet_id      = aws_subnet.prod-private-subnet2.id
  route_table_id = aws_route_table.prod-private-route-table.id
}


# prod internet gateway

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "dev-environment"
  }
}


#associating prod-igw to prod public route table

resource "aws_route_table_association" "associating-prod-igw-to-prod-public-route-table" {
  gateway_id     = aws_internet_gateway.prod-igw.id
  route_table_id = aws_route_table.prod-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
}

# prod elastic ip address
resource "aws_eip" "prod-elasticip" {
}



# this is prod nat gateway
resource "aws_nat_gateway" "prod-nat-gateway" {
    allocation_id = aws_eip.prod-elasticip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.prod-public-subnet1.id
}



# associating nat gateway to prod private route table

resource "aws_route" "associating-prod-nat-gateway-through-route" {
  gateway_id     = aws_nat_gateway.prod-nat-gateway.id
  route_table_id = aws_route_table.prod-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
}
# creating prod cloud networknhouse

resource "aws_vpc" "prod-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod public subnet1

resource "aws_subnet" "prod-public-subnet1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod public subnet2
resource "aws_subnet" "prod-pub-subnet2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.110.0/24"

  tags = {
    Name = "dev-environment"
  }
}


# prod public route table

resource "aws_route_table" "prod-public-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "dev-environment"
  }
}

# associating prod public route table to prod public subnet1
resource "aws_route_table_association" "associate-with-prod-pub-subnet1" {
  subnet_id      = aws_subnet.prod-public-subnet1.id
  route_table_id = aws_route_table.prod-public-route-table.id
}

  #associating prod public route table to prod public subnet2
resource "aws_route_table_association" "associate-with-pub-subnet2" {
  subnet_id      = aws_subnet.prod-pub-subnet2.id
  route_table_id = aws_route_table.prod-public-route-table.id
}


# this is prod private subnet1
resource "aws_subnet" "prod-private-subnet1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.120.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# this is prod private subnet2
resource "aws_subnet" "prod-private-subnet2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.130.0/24"

  tags = {
    Name = "dev-environment"
  }
}

# prod private route table
resource "aws_route_table" "prod-private-route-table" {
  vpc_id = aws_vpc.prod-vpc.id


  tags = {
    Name = "dev-environment"
  }
}

#asociating prod private route table to prod private subnet1
resource "aws_route_table_association" "associate-with-private-subnet1" {
  subnet_id      = aws_subnet.prod-private-subnet1.id
  route_table_id = aws_route_table.prod-private-route-table.id
}

#associating prod private route table to prod private subnet2
resource "aws_route_table_association" "associate-with-private-subnet2" {
  subnet_id      = aws_subnet.prod-private-subnet2.id
  route_table_id = aws_route_table.prod-private-route-table.id
}


# prod internet gateway

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "dev-environment"
  }
}


#associating prod-igw to prod public route table

resource "aws_route_table_association" "associating-prod-igw-to-prod-public-route-table" {
  gateway_id     = aws_internet_gateway.prod-igw.id
  route_table_id = aws_route_table.prod-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
}

# prod elastic ip address
resource "aws_eip" "prod-elasticip" {
}



# this is prod nat gateway
resource "aws_nat_gateway" "prod-nat-gateway" {
    allocation_id = aws_eip.prod-elasticip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.prod-public-subnet1.id
}



# associating nat gateway to prod private route table

resource "aws_route" "associating-prod-nat-gateway-through-route" {
  gateway_id     = aws_nat_gateway.prod-nat-gateway.id
  route_table_id = aws_route_table.prod-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
}























