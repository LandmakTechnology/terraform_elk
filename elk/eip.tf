resource "aws_eip" "ip" {
  depends_on = [aws_instance.my_elk_instance]
  instance = aws_instance.my_elk_instance.id
}
