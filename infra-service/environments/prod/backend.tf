terraform {
  backend "gcs" {
    bucket = "YOUR_PROJECT_PREFIX-bucket-tfstate"
    prefix = "terraform/state/prod/YOUR_SERVICE_NAME"
  }
}
