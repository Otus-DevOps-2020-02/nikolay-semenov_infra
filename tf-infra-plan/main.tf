provider "google" {
  version      = ">= 2.12.0"
  region       = "europe-west3"
  project      = "PROJECT ID"
}

module "otus-cloud-bastion" {
  source                              = "../tf-infra-modules/otus-cloud-bastion/"
  project_id                          = "PROJECT ID"
  project_namespace                   = "cloud-bastion"
  project_environment                 = "home-work"
  vpc_availability_zones              = "europe-west3-a"
  vpc_availability_region             = "europe-west3"
  vpc_cidr_first_two_octets           = "10.156"
  compute_instance_1_public_interface = ""
  compute_bastion_1_public_interface  = ""
  compute_instance_1_type             = "f1-micro"
  compute_bastion_1_type              = "f1-micro"
  compute_image_id                    = "ubuntu-1804-bionic-v20200218"
}
