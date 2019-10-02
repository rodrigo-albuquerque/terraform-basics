provider "google" {
  credentials = "${file("../rodrigo-albuquerque-ea02c91e15d4.json")}"
  project = "rodrigo-albuquerque"
  region = "europe-west1-d"
}

provider "aws" {
  region = "eu-west-2"
}

provider "azurerm" {
  subscription_id = "0"
  client_id = "1"
  client_secret = "2"
  tenant_id = "3"
}
