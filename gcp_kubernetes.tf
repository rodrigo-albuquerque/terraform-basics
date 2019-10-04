resource "google_container_cluster" "rod-cluster" {
    name = "rod-k8s-cluster"
    location = "europe-west1-d"
    initial_node_count = "3"

    node_locations = [
        "europe-west1-b"
    ]

    master_auth {
        password = "password-16-or-more-characters"
        username = "username"
    }

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]
    }
}