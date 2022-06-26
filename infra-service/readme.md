
## initial setup of `backend.tf`
replace in `environments/xxx/backend.tf`

- `YOUR_PROJECT_PREFIX`
- `YOUR_SERVICE_NAME`

```terraform
terraform {
  backend "gcs" {
    bucket = "YOUR_PROJECT_PREFIX-bucket-tfstate"
    prefix = "terraform/state/prod/YOUR_SERVICE_NAME"
  }
}
```

## Tip: work inside the `modules` folder (not in `environments`)

The only use cases where you need to make a change in the `environments`

- initial setup of `backend.tf` as described above
- adding a new variable (yeah, this touches a lot of files, it sucks)
  - `environments/xxx/main.tf` create variable (for every env)
  - `environments/xxx/main.tf` pass variable to main module (for every env)
  - `modules/main/variables.tf` create variable
  - `modules/main/main.tf` use variable

other than that, all work should be in `modules/main` or in `modules/xxx` if you create your own submodules

## Tip: add a `terraform.tfvars` file in each environment folder
probably the same file per project (yeah, I should think of a way to avoid copying, it sucks)

```terraform
project_id          = "your-google-project-id"
region              = "europe-west2"
zone                = "europe-west2-a"
project_name_prefix = "your-unique-project-name"
```

