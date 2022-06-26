variable project_id {}
variable region {}
variable zone {}
variable project_name_prefix {}
variable labels {
  default = {}
}

module "main" {
  source      = "../../modules/main"
  project_id  = var.project_id
  region      = var.region
  zone        = var.zone
  labels      = var.labels
  project_name_prefix = var.project_name_prefix
}

output spike {
  value = module.main
}