we can correct resource drift using 3 apply flags

```sh
replace
refresh
import
```

---

1) ```replace```

Suppose we have multiple resources and one resource is depricated or changed

we can update the sttae file for that resource only by using 
```sh
terraform -replace resource_type.resouce_name
```
this will create and destroy the specic resorce so state is synced with remote

can be used on multiple resources 

eg:-

```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform state list
module.Expressions.aws_instance.myserver
srivatsa@pop-os:~/golang-lco/Terraform$ terraform plan --replace="module.Expressions.aws_instance.myserver"
module.Expressions.aws_instance.myserver: Refreshing state... [id=i-014eace322bb21003]

Terraform used the selected providers to generate the following execution plan. Resource
actions are indicated with the following symbols:
-/+ destroy and then create replacement
```
---

2) ```--replace-only``` flag is used when aresuorce is changes in remote and you want to update your local stet with your remote infra

```sh
rivatsa@pop-os:~/golang-lco/Terraform$ terraform apply --refresh-only 
module.Expressions.aws_instance.myserver: Refreshing state... [id=i-014eace322bb21003]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last
"terraform apply" which may have affected this plan:
```

note if you do ```terraform apply``` it will make remote infra match with local infra

Or 

we can use tf state rm to remove the particular state resource

---
3) import 


It is used to impirt already existing infra into your state file.

for this you need to specify th resource block with resource id

generic syntax
```sh
terraform import path-to-resorce resource-id
```

eg:-
```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform import module.Expressions.aws_s3_bucket.buk lava3825cakes
module.Expressions.aws_s3_bucket.buk: Importing from ID "lava3825cakes"...
module.Expressions.aws_s3_bucket.buk: Import prepared!
  Prepared aws_s3_bucket for import
module.Expressions.aws_s3_bucket.buk: Refreshing state... [id=lava3825cakes]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

