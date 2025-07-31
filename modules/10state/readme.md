terrafrom state has follwing sub command:-s
```sh
Subcommands:
    identities          List the identities of resources in the state
    list                List resources in the state
    mv                  Move an item in the state
    pull                Pull current state and output to stdout
    push                Update remote state from a local state file
    replace-provider    Replace provider in the state
    rm                  Remove instances from the state
    show                Show a resource in the state
```
---
```list``` -  will give names of the states or resources that are present in the tf
```show state-name``` will give in detail explanantion about the particular state or resorce
eg:-

```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform state show module.Expressions.data.aws_vpc.name
# module.Expressions.data.aws_vpc.name:
data "aws_vpc" "name" {
    arn                                  = "arn:aws:ec2:ap-"
    cidr_block                           = "172.31.0.0/16"
    cidr_block_associations              = [
        {
            association_id = "vpc-cidr-assoc-"
            cidr_block     = "172.31.0.0/16"
            state          = "associated"
        },
    ]
    default                              = true
    dhcp_options_id                      = "dopt-0"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    id                                   = "vpc-0b3"
    instance_tenancy                     = "default"
    ipv6_association_id                  = null
    ipv6_cidr_block                      = null
    main_route_table_id                  = "rtb-00"
    owner_id                             = "37392"
    region                               = "ap"
    tags                                 = {}
}
srivatsa@pop-os:~/golang-lco/Terraform$ 

```

---

```mv`` is used to chnage the resource name from one to other
it can also be used to move resouce into module or module into module

```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform state mv module.Expressions.aws_security_gro
up.allow_tls module.Expressions.aws_security_group.dont_allow_tls
Move "module.Expressions.aws_security_group.allow_tls" to "module.Expressions.aws_security_group.dont_allow_tls"
Successfully moved 1 object(s).
srivatsa@pop-os:~/golang-lco/Terraform$ 
```
Note this only updates state file, not the acutal resiurces

If  you do tf plan it will look a the online resouce and chaneg the local state file to mach the remote state

This ismainly used to correct the drifts that are moade outside of tf


