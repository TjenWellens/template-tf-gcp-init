This module is supposed to be run once per project.

It creates 
- a service account for further operations with terraform.
- a buckets for storing the terraform-state (for this setup only)


### initial setup
This assumes you're the first person working on this project. 
If not, someone else has already done this, and you don't have to!
```
# 1) comment out backend.tf

# 2) login to gcloud
gcloud auth login
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)

# 3) create everything
terraform -chdir=infra-util init
terraform -chdir=infra-util plan
terraform -chdir=infra-util apply

# 4) comment backend.tf back in
# make sure that 'bucket' matches the output 'bucket-tfstate-name' from previous step

# 5) move state from local to gcloud
terraform -chdir=infra-util init
terraform -chdir=infra-util plan
terraform -chdir=infra-util apply
# Do you want to copy existing state to the new backend? --> yes

# 6) logout from gcloud
gcloud auth revoke
export GOOGLE_OAUTH_ACCESS_TOKEN=""
```