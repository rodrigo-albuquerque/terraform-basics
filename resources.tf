resource "google_compute_network" "our_development_network" {
  name = "mynetwork"
  auto_create_subnetworks = true
}

resource "aws_vpc" "vpc_example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}
