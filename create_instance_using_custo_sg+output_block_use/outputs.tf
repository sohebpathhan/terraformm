output "public_ip" {
  value = aws_instance.pract03.public_ip
}

output "public_dns" {
  value = aws_instance.pract03.public_dns
}
output "instance_id" {
  value = aws_instance.pract03.id
}
output "security_group_id" {
  value = aws_security_group.my_sg_01.id
}

