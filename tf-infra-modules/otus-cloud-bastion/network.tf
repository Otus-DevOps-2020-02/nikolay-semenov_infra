module "vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = "${var.project_id}"
  network_name = "${var.project_namespace}-${var.project_environment}"
  routing_mode = "GLOBAL"

  subnets = [
      {
          subnet_name           = "${var.project_namespace}-${var.project_environment}-subnet-1"
          subnet_ip             = "${var.vpc_cidr_first_two_octets}.11.0/24"
          subnet_region         = "${var.vpc_availability_region}"
          subnet_private_access = "true"
      }
  ]

}
