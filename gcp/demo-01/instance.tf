resource "google_compute_instance" "www" {
  name         = "tf-demo-1"
  machine_type = "f1-micro"
  zone         = "${var.region_zone}"

  disk {
    image = "${lookup(var.images, var.gce_image)}"
  }

  network_interface {
    network = "default"
  }

}