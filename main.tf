resource "google_service_account" "server_sa" {
  account_id   = var.account_id
  display_name = "Service Account for  Server VM"
}

resource "google_compute_instance" "server_vm" {
  for_each     = var.vm_info
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone


  tags = ["server", "glps-prod"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }


  network_interface {
    network    = google_compute_network.prod_vpc.id
    subnetwork = google_compute_subnetwork.subnet[each.value.subnet].name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("userdata.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.server_sa.email
    scopes = ["cloud-platform"]
  }
}



