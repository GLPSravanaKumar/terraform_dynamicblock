output "server_vm_id" {
  description = "Instance ID of the web server VM"
  value       = {
    for k,v in google_compute_instance.server_vm:
    k=>v.id
  }
}

output "server_vm_public_ip" {
  description = "Public IP address of the web server VM"
  value       = {
    for k,v in google_compute_instance.server_vm:
    k=>v.network_interface[0].access_config[0].nat_ip
  }
}

output "server_sa_email" {
  description = "Email of the web server service account"
  value       = google_service_account.server_sa.email
}

output "prod_vpc_id" {
  description = "ID of the production VPC network"
  value       = google_compute_network.prod_vpc.id
}

output "subnet_id" {
  description = "ID of the web server subnet"
  value       = {
    for k,v in google_compute_subnetwork.subnet :
    k=>v.id
  }
}
