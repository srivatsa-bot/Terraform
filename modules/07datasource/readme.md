In Terraform, ```data sources``` allow you to fetch and use information from outside Terraform, but without creating or managing the resource. You use them to read information from existing infrastructure (like an AMI, VPC, IAM role, etc.), or even outputs from other modules or remote states.

basic syntax
```sh
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

```

note that the most_recent,owners,tag sare specific t oaws can, these mapping can chnage with provider

to output the value from the daata sirce we can use output block with value=data.resouce.label