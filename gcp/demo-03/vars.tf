variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-f"
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
}

variable "gce_image" {
  description = "Image to use to start a VM"
}

variable "images" {
  type = "map"
  default = {
    ubuntu-1404 = "ubuntu-os-cloud/ubuntu-1404-trusty-v20161213"
    ubuntu-1604 = "ubuntu-os-cloud/ubuntu-1604-xenial-v20161221"
  }
}