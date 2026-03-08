provider "aws" {
  region = var.region
}
# create vpc
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# create_subnet
resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = var.subnet_name
  }
}

# igw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = var.igw_name
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
        Name = var.route_table_name
    }
}


# create instance with resource
resource "aws_instance" "myinstance" {
    ami = var.ami_id
    instance_type = var.ins_type
    key_name = "shoh"
    subnet_id = aws_subnet.mysubnet.id
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

# create security group
resource "aws_security_group" "mysg" {
    name = var.security_group_name
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