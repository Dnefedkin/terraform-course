resource "google_compute_instance" "www" {
  name         = "tf-demo-1"
  machine_type = "f1-micro"
  zone         = "${var.region_zone}"

  disk {
    image = "${lookup(var.images, var.gce_image)}"
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata {
    ssh-keys = "${var.instance_username}:${file("${var.public_key_path}")}"
  }

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  connection {
    type        = "ssh"
    user 		= "${var.instance_username}"
    private_key = "${file("${var.private_key_path}")}"
    agent 		= false
  }


}