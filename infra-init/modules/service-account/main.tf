resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_id
  description  = var.service_account_description
}

resource "google_project_iam_member" "service_account" {
  for_each = toset(var.roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.service_account.email}"
}