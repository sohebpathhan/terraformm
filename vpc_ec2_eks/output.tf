output "instance_public_ip" {
  value = aws_instance.myinstance.public_ip
}
output "instance_id" {
  value = aws_instance.myinstance.id
}   
output "vpc_id" {
  value = aws_vpc.myvpc.id
}   
