variable "project_id" {
  description = "GCP project id"
  default     = "centos-6-v20180104"
}

variable "project_namespace" {
  description = "GCP project namespace"
  default     = "cloud-bastion"
}

variable "project_environment" {
  description = "Project environment"
  default     = "home-work"
}

variable "vpc_availability_zones" {
  description = "VPC availability zones"
}

variable "vpc_availability_region" {
  description = "VPC availability region"
}

variable "vpc_cidr_first_two_octets" {
  description = "VPC first two octest"
}

variable "compute_instance_1_public_interface" {
  description = "Public ip interface for instance"
}

variable "compute_bastion_1_public_interface" {
  description = "Public ip interface for instance"
}

variable "compute_instance_1_type" {
  description = "Instance type micro,nano,big and etc"
}

variable "compute_bastion_1_type" {
  description = "Instance type micro,nano,big and etc"
}

variable "compute_image_id" {
  description = "OS image id"
}
