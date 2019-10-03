resource "google_compute_network" "our_development_network" {
  name = "mynetwork"
  auto_create_subnetworks = false
}
resource "aws_vpc" "vpc_example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
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