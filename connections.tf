provider "google" {
  credentials = "${file("../f5-gcs-5557-mktg-devcentral-ab07544cb98f.json")}"
  project = "f5-gcs-5557-mktg-devcentral"
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
