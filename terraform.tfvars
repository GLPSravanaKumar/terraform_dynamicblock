account_id = "glps-prod-sa"
vm_info = {
  prod = {
    name         = "glps-prod-vm",
    machine_type = "n4-standard-2",
    zone         = "asia-south1-a",
    subnet       = "glps-prod-subnet1"
  }
  testing = {
    name         = "glps-testing-vm",
    machine_type = "e2-medium",
    zone         = "asia-south1-b"
    subnet       = "glps-prod-subnet2"
  }
  /* dev = {
        name = "glps-dev-vm",
        machine_type = "e2-medium",
        zone = "asia-south1-b"
    } */
}
/* machine_type     = ["c3-standard-4", "e2-medium"]
zone             = [ "asia-south1-a", "asia-south1-b"] */
image    = "ubuntu-os-cloud/ubuntu-2204-lts"
vpc_name = "glps-prod-vpc"

subnet = {
  glps-prod-subnet1 = {
    cidr = "10.0.10.0/24"
  }
  glps-prod-subnet2 = {
    cidr = "10.0.20.0/24"
  }
}
region        = "asia-south1"
firewall_name = "glps-prod-firewall"
firewall_rules = {
  allow_http = {
    protocol = "tcp",
    ports    = ["80", "8080"]
  }
  allow_ssh = {
    protocol = "tcp",
    ports    = ["22"]
  }
}

