resource "aws_instance" "pract1" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "micro_central"
  security_groups = ["default"]

  tags = {
    Name="pract1"
  }
}   