resource "google_project_service" "enable_api" {
  for_each                   = toset(var.enable_apis)
  project                    = var.project_id
  service                    = each.key
  disable_dependent_services = true
}