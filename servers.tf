resource "google_compute_instance" "firstserver" {
    name = "myfirstserver"
    machine_type = "n1-standard-1"
    zone = "europe-west1-d"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.rod-subnet.name}"

        access_config {
        }
    }

  service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
