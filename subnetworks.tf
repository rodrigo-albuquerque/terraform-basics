resource "google_compute_subnetwork" "rod-subnet" {
  ip_cidr_range = "${var.gcp_ip_cidr_range}"
  name = "${var.subnet_names["subnet1"]}"
  network = "${google_compute_network.our_development_network.self_link}"
  region = "europe-west1"
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