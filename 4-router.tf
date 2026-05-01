resource "google_compute_router" "router" {
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.main.id

  bgp {
    asn = 64514
  }

  depends_on = [
    google_compute_network.main
  ]
}

#Router for VPC erica


resource "google_compute_router" "router-brazil" {
  name    = "router-brazil"
  region  = "us-central1"
  network = google_compute_network.brazilians.id

  bgp {
    asn = 65514
  }

  depends_on = [
    google_compute_network.brazilians
  ]
}