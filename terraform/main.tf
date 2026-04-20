provider "google" {
  # We use a variable here for security and flexibility
  project = var.project_id 
  region  = "us-central1"
}

# Data Lake (Storage)
resource "google_storage_bucket" "data-lake" {
  name          = "nexus-crypto-data-lake-${var.project_id}" # Dynamic naming
  location      = "US"
  force_destroy = true
}

# Data Warehouse (BigQuery)
resource "google_bigquery_dataset" "dataset" {
  dataset_id = "nexus_crypto_analytics"
  location   = "US"
}