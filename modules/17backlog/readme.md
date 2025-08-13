The backend defines where Terraform stores its state data files.

If your configuration includes a cloud block, it cannot include a backend block.


# state.tf
terraform {
  backend "s3" {
    bucket = "" 
    key    = ""
    region = ""
    profile= ""
  }
}

to make the backend info not go into lock files we will give details in runtime but still always use env variabels

`terraform init -backend-config="./state.config"`

# state.config
bucket = "your-bucket" 
key    = "your-state.tfstate"
region = "eu-central-1"
profile= "Your_Profile"



if you cahnge backend config mid way?

```sh
option 1: terraform init -migrate-state

Use this if you want to move your existing state to the new backend configuration

Terraform will attempt to automatically transfer your current state to the new location

This preserves your existing infrastructure state

With -reconfigure:

Terraform says: "I'll use this new S3+DynamoDB config"
"But I'm starting fresh - I won't connect to any existing state"
Your old state file stays in S3, but Terraform acts like it doesn't exist
Result: Terraform "forgets" about your existing infrastructure


```

terraform init -migrate-state:
Terraform copies/moves your existing state file from the old backend location to the new backend location while preserving all resource tracking.
terraform init -reconfigure:
Terraform updates its local configuration to use the new backend settings but leaves the existing state file where it is and stops referencing it entirely.


