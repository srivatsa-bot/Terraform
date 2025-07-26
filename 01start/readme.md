#go do any dir and touch main.tf
#in that paste boilelr pate of provider
#set your creds as env

#do this to check for indentation errors
```sh
terraform fmt
```
#do this to check you have all dependencies in your hcl code before running
Note it doesnt check weather the values you gave are tight or wrong, thats on you
```sh
terraform validate
```

#do to intialize project
```sh
terraform init
```
when you run thsi a ```.terraform.lock.hcl``` is created which as all the versions of providers moduels, so evertime you run plan it with calidate the version with ```.lock.hcl``` file


this will give you the chanegs that are going to happen
```sh 
terraform plan 
```
you can also do ```terraform plan -out <name>``` so the paln is saved for further review

#this will execute the saved main.tf file 
```sh
terraform apply
```

sometimes terrafrom will change entire resource and redeploy it again while sttill trying to maintain the same state as previous one 
eg: you change the name of ec2 its going be reflected with no re deployment

```sh
 ~ symbol means an in-place update (the resource will not be destroyed and recreated, just updated).
```
--- 

how to use varibles

we use variable attrbute for it main.tf

eg:
```sh
variable "var_name" {
  type = string
}
```
you can supply the name in 2 ways, by cli or creating ````terraform.tfvars````

cli way(even if you dont specify var it will give a promt to neter it)
```sh
terraform apply -var tag_name="Srivatsa"
```
creating ```terraform.tfvars``` tere you will assign ```tag_namr`` some vairbale and save it
```sh
terraform apply or plan
```
you can store multiple file in .tfvars

---

Local variabels

the variables we defined are hard coded or given during runtime,
local variabels are used to leaverage in-line variable sthat you defined
```sh
locals {
  tag_name="damn"
}

#aws resource
resource "aws_instance" "myserver" {
  ami           = "ami-0d0ad8bb301edb745"
  instance_type = "t2.micro"

  tags = {
    # Name = local.tag_name
    # or
    Name  = "Server-${local.tag_name}" #you can also use in line code
  }
}
```
---

When we launch resources they have outputs like ip,subnetect to get those use use ```output``` block and give it a name(same for any block)

attributes of ec2 ```https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#attribute-reference``` or look ```.tfstate``` for attributes

general synatx to output one attribute
```sh
output "name" {
  value = 
}
```

run ```terraform output```  after you do ```terraform applpy```

if you already have deployed resouces and want to get output you can do
```sh
terrafform refresh
```

when to use ```terraform refresh```, suppose you made chanegs to the output block even if you save the file, it will not be stored in statefile(```.tfstate```) until you do terrraform apply.

so ```refresh``` is going to update the statefile(doing apply inderneath)
or
yu can use this when the changes made to resouces are not stored in statefile(to sync with infra), eg - when someone chnages through gui

eg - 

```sh
output "id" {
  value = {
    ami = aws_instance.myserver.ami
  }
}
```

```terrafom plan```

```sh
output "id" {
  value = {
    ami = aws_instance.myserver.ami
  }
}
```
to get output

```sh
terraform output 
or
terrafrom output id(output block name)
```

Now to destroy the thins that we created using ```main.tf``` 
```sh
terraform destroy
```
It will destroy all the infra in the ```.tfState```, stae file goes back to original(emoty state when you di terraform init)



