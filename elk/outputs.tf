output "public_ip" {
  value = aws_eip.ip.public_ip
}

output "private_ip" {
  value = aws_instance.my_elk_instance.private_ip
}
