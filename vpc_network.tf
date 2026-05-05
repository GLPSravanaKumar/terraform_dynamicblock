resource "google_compute_network" "prod_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description             = "Production VPC for  server infrastructure"
}

resource "google_compute_subnetwork" "subnet" {
  for_each = var.subnet
  name          = each.key
  ip_cidr_range = each.value.cidr
  region        = var.region
  network       = google_compute_network.prod_vpc.id
  description   = " server subnet in production VPC"
}

resource "google_compute_firewall" "server_firewall" {
  name        = var.firewall_name
  network     = google_compute_network.prod_vpc.id
  description = "Firewall rules for server traffic"

  dynamic "allow" {
    for_each = var.firewall_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["server"]
}
