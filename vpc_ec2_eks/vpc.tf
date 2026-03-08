provider "aws" {
  region = "us-east-2"
}
# create vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

# create_subnet
resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "mysubnet"
  }
}

# igw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myigw"
  }
}
# default route table
resource "aws_default_route_table" "main_rt" {
    default_route_table_id = aws_vpc.myvpc.default_route_table_id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags = {
        Name = "main_rt"
    }
}


# create instance with resource
resource "aws_instance" "myinstance" {
    ami = "ami-06e3c045d79fd65d9"
    instance_type = "t3.micro"
    key_name = "shoh"
    subnet_id = aws_subnet.mysubnet.id
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

# create security group
resource "aws_security_group" "mysg" {
    name = "mysg"
    description = "Allow HTTP and SSH traffic"
    vpc_id = aws_vpc.myvpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}