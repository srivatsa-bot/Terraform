Dynamic is the most advanced iteration 

Supposse we hav buch of ingress and outgress rules for ec2, setting them up in resource block or variable block is lot of boilerpale

so you will define a lisst - mapping in local for sg, and use dynaic vlock insude resuorce block to iterate through the list

```sh
dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
```

you define for_each , so for evey elemt in lsit it will apply the resuorces in ```content``` block reperatly, rather than youdefinging the resource block multiple times.

same result can be achiwved using ```for_each  = toset(var.sg)``` at the start of the resouce block, so resouce block runs list amount of times

```sh
resource "aws_security_group" "allow_tls" {
  for_each = toset(var.sg)
  
  name        = "allow_tls_${each.value}"
  description = "Allow TLS inbound traffic on port ${each.value}"
  vpc_id      = data.aws_vpc.name.id

  ingress {
    description = "Allow TCP on port ${each.value}"
    from_port   = each.value  #in dynamic we use dynamic block name
    to_port     = each.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```
