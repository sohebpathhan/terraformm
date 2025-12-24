resource "aws_instance" "pract1" {
  ami = "ami-0d5d9d301c853a04a"
  instance_type = "t3.micro"
  key_name = "micro_central"
  security_groups = ["default"]

  tags = {
    Name="pract1"
  }
}   