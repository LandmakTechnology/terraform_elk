# Time to wait for the instance to bootstrap with the script.
resource "time_sleep" "wait_for_instance" {
  create_duration = "180s"

  depends_on = [aws_instance.my_elk_instance]
}
