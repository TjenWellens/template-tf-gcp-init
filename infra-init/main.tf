resource "google_storage_bucket" "default" {
  name          = "${var.project_name_prefix}-bucket-tfstate"
  force_destroy = false
  location      = var.region
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  labels = var.labels
}

module "enable-apis" {
  source                      = "./modules/enable-apis"
  project_id                  = var.project_id
  enable_apis                 = [
    "storage.googleapis.com",
  ]
}

module "service-account" {
  source                      = "./modules/service-account"
  project_id                  = var.project_id
  service_account_id          = "terraform-gcp"
  service_account_description = "Service account for terraforming everything."
  roles = [
    "roles/storage.admin",
  ]
  depends_on = [module.enable-apis]
}