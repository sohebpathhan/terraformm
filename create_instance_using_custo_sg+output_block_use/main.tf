resource "aws_security_group" "my_sg_01" {
    name = "my_sg_01"
    description = "My custom security group 01"
    #inbound rule
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #outbound rule
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }       
}

resource "aws_instance" "pract03" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "micro_central"
  security_groups = [aws_security_group.my_sg_01.name]

  tags = {
    Name="pract03"
  }
}

variable "ami_id" {
  default = "ami-0abac8735a38475db"
}

variable "instance_type" {
  default = "t3.micro"
}