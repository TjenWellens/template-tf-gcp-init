## infra-init

Creates basic infrastructure for a project:

- a bucket for terraform state
- enabled apis
- a service account for your deployment pipeline

### Why is this useful?

- IaC EVERYTHING!
- If you want to start a new env in a new google-project, you don't want to manually enable all required api's
- CI/CD pipeline

### When to use this

- you are the first person setting up a new project
- your project requires new apis
- your project's service account requires new permissions

### How to use this template (once per project)

1. copy it into your folder
2. follow the steps in the [readme](./infra-init/readme.md)

### Tips

- add the minimal role possible, for security reasons

---

## infra-service

Creates basic scaffolding for your service according
to [Google's terraform best practices](https://cloud.google.com/docs/terraform/best-practices-for-terraform#subdirectories)

### How to use this template (once per service)

1. copy it into your folder
2. follow the steps in the [readme](./infra-service/readme.md)

### Tips
- run the infra-service always as a service account, this way you keep it's permissions up to date (see 'How to' section)

---

## How to

### Use docker to avoid installing npm / node / etc

https://github.com/tjenwellens/docker-alias

### Run terraform commmands as your user

```shell
gcloud auth login
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)

# whatever terraform commands you want to run
terraform init
terraform plan
```

### Run terraform commmands as a service-account (instead of your user-account)

1. go
   to [google cloud console project](https://console.cloud.google.com/home/dashboard?project=data-driven-devices-6176)
2. Navigate to 'IAM & Admin'
    - '[Service accounts](https://console.cloud.google.com/iam-admin/serviceaccounts?project=data-driven-devices-6176)'
3. Navigate to the service account - PERMISSIONS
4. Grant access
    - New principals = `<your-email>`
    - Role = `Service Account Token Creator` (aka `roles/iam.serviceAccountTokenCreator`)

```shell
gcloud auth login
SERVICE_ACCOUNT = "<sa-email>"
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud --impersonate-service-account=${SERVICE_ACCOUNT} auth print-access-token)

# whatever terraform commands you want to run
terraform init
terraform plan
```
