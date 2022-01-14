#Create AWS Instance
resource "aws_instance" "my_elk_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  availability_zone = "us-west-1a"
  key_name      = var.my_key

  vpc_security_group_ids = [
    aws_security_group.allow_elk1.id,
  ]

  depends_on = [aws_security_group.allow_elk1]

  tags = {
    Name = "ELK-Instance"
  }
}
