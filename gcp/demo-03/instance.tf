resource "google_compute_instance" "example" {
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

  provisioner "local-exec" {
     command = "echo ${google_compute_instance.example.network_interface.0.address} >> private_ips.txt"
  }

}

output "ip" {
    value = "${google_compute_instance.example.network_interface.0.access_config.0.assigned_nat_ip}"
}
