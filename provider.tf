terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.28.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "devops-493413"
  region  = "asia-south1"
}