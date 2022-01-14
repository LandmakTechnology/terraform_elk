# Create a Null Resource and Provisioners
resource "null_resource" "my_null_resource" {
  depends_on = [time_sleep.wait_for_instance]
  # Connection Block for Provisioners to connect to the EC2 Instance

  connection {
    host        = aws_eip.ip.public_ip
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }


  provisioner "file" {
      source = "elasticsearch.yml"
      destination = "/tmp/elasticsearch.yml"
    }

  provisioner "file" {
      source = "kibana.yml"
      destination = "/tmp/kibana.yml"
   }

  provisioner "file" {
      source = "apache-01.conf"
      destination = "/tmp/apache-01.conf"
   }

    provisioner "file" {
      source = "installELK.sh"
      destination = "/tmp/installELK.sh"
   }

  provisioner "remote-exec" {
    inline = [
      "chmod +x    /tmp/installELK.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installELK.sh",  # Remove the spurious CR characters.
      "sudo /tmp/installELK.sh",
    ]
  }
}
