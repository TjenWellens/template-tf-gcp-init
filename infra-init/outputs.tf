output "bucket-tfstate-name" {
  value = google_storage_bucket.default.name
}

output "service-account" {
  value = module.service-account
}
