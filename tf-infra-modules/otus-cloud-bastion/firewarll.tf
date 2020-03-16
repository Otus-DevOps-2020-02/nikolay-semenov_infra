resource "google_compute_firewall" "allow-basic" {
  name    = "${var.project_namespace}-${var.project_environment}-fw"
  network = "${var.project_namespace}-${var.project_environment}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "80"]
  }

  allow {
    protocol = "udp"
    ports    = ["14803"]
  }
}
