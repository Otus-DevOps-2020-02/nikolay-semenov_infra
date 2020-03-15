### COMPUTE
resource "google_compute_instance" "bastion_1" {
  name         = "bastion-1"
  machine_type = "${var.compute_bastion_1_type}"
  zone         = "${var.vpc_availability_zones}"

  tags = ["b-1"]

  boot_disk {
    initialize_params {
      image = "${var.compute_image_id}"
    }
   }

  network_interface {
    subnetwork    = "${var.project_namespace}-${var.project_environment}-subnet-1"

    access_config {
      nat_ip       = "${var.compute_bastion_1_public_interface}"
      network_tier = "STANDARD"
    }
  }

  timeouts {
    create = "5m"
    delete = "5m"
  }
}


resource "google_compute_instance" "instance_1" {
  name         = "instance-1"
  machine_type = "${var.compute_instance_1_type}"
  zone         = "${var.vpc_availability_zones}"

  tags = ["i-1"]

  boot_disk {
    initialize_params {
      image = "${var.compute_image_id}"
    }
   }

  network_interface {
    subnetwork    = "${var.project_namespace}-${var.project_environment}-subnet-1"
  }

  timeouts {
    create = "5m"
    delete = "5m"
  }
}
