terraform {
  backend "gcs" {
    bucket = "state-backend-48d633"
    prefix = "terraform/states/fajarmaftuhfadli-cloudflare-terraform"
  }
}
