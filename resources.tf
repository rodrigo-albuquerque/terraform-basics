resource "google_compute_network" "our_development_network" {
  name = "mynetwork"
  auto_create_subnetworks = false
}

resource "aws_vpc" "vpc_example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_example.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.vpc_example.id}"
  availability_zone = "eu-west-2a"
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_example.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.vpc_example.id}"
  availability_zone = "eu-west-2b"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.vpc_example.id}"
  ingress {
    cidr_blocks = [
      "${aws_vpc.vpc_example.cidr_block}"
    ]

    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

resource "azurerm_resource_group" "az_network" {
  location = "westeurope"
  name = "rodresgroup"
}

resource "azurerm_virtual_network" "blue_virtual_network" {
  address_space = ["10.0.0.0/16"]
  location = "westeurope"
  name = "rodvirtnetwork"
  resource_group_name = "${azurerm_resource_group.az_network.name}"
  dns_servers = ["10.0.0.4", "10.0.0.5"]
  subnet {
    name = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

}