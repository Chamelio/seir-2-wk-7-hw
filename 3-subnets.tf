#Go to:
#VPC Network → Subnets
#Confirm:

#    subnet exists
#    secondary ranges visible



resource "google_compute_subnetwork" "private" {
  name                     = "dominicanas"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  # IMPORTANT:
  # These CIDR ranges MUST NOT overlap
  # Do not modify unless you understand subnetting

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }

  depends_on = [
    google_compute_network.main
  ]
}


#Subnets for VPC2

#Go to:
#VPC Network → Subnets
#Confirm:

#    subnet exists
#    secondary ranges visible



resource "google_compute_subnetwork" "erica" {
  name                     = "erica-subnet"
  ip_cidr_range            = "10.3.0.0/18"
  region                   = "us-central1"
  network                  = google_compute_network.brazilians.id
  private_ip_google_access = true

  # IMPORTANT:
  # These CIDR ranges MUST NOT overlap
  # Do not modify unless you understand subnetting

  secondary_ip_range {
    range_name    = "k8s-erica-range"
    ip_cidr_range = "10.148.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-erica2-range"
    ip_cidr_range = "10.152.0.0/20"
  }

  depends_on = [
    google_compute_network.brazilians
  ]
}