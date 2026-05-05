variable "account_id" {
  type = string
}
variable "vm_info" {
  type = map(object(
    {
      name         = string,
      machine_type = string,
      zone         = string,
      subnet       = string
    }
  ))
}
/* variable "machine_type" {
  type = string
} */
/* variable "zone" {
  type = set(string)
} */
variable "image" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "subnet" {
  type = map(object({
    cidr = string
  }))
}
/* variable "subnet_cidr" {
  type = set(string)
} */
variable "region" {
  type = string
}
variable "firewall_name" {
  type = string
}
variable "firewall_rules" {
  type = map(object({
    protocol = string,
    ports    = set(string)
  }))
}
