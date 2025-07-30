Terraform's lifecycle meta-argument lets you control how resources are created, updated, and deleted during a Terraform run. It's not tied to the actual infrastructure but rather influences Terraform's behavior and state transitions.

syntax
```sh
lifecycle{
    condition=bool
}
```

```3``` conditions
1) ```create_before_destroy``` = Ensures new resources are provisioned before the old ones are destroyed.

2) ```prevent_destroy``` = Blocks accidental or intentional terraform destroy of the resource.

3) ```ignore_changes``` =  Tells Terraform to ignore specific attribute changes in the resource.

eg:-

```sh
resource "aws_instance" "example" {
  lifecycle {
    ignore_changes = [tags, user_data]
  }
}
```


Imp commands

```terraform state list``` - Shows all resources Terraform currently manages.

```terraform show``` - Displays a full summary of the current state file, including values of all managed resources.


