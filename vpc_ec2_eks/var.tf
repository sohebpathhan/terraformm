# Variable for region
variable "region" {
  default = "us-east-2"
}
# vpc name  
variable "vpc_name" {
  default = "myvpc" 
}
# subnet name
variable "subnet_name" {
  default = "mysubnet"
}   
# ciderblock for vpc
variable "vpc_cidr_block" {
  default = "10.0.0.0/20"
}


# igw name
variable "igw_name" {   
  default = "myigw"
}   
# route table name          
variable "route_table_name" {
  default = "main_rt"
}
# instance name
variable "instance_name" {  
  default = "myinstance"
}   
# security group name   
variable "security_group_name" {
  default = "mysg"
}   

# EC@ instance 
variable "ins_type" {
  default = "t3.micro"
}
# ec2 instance ami
variable "ami_id" {
  default = "ami-06e3c045d79fd65d9"
}
