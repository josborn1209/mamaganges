terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "dependable-fuze-419023"
region = "us-east1"
zone = "us-east1-a"
credentials = "dependable-fuze-419023-a60e117680d1.json"
}

resource "google_storage_bucket" "auto-expire-gcp-class-example" {
  name          = "auto-expiring-bucket-gcp-class-example"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}