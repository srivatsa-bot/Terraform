so we use varibales in rf to store some fixed values

there are various ways to define varibales

1) in main.tf file itsef using ```varibale``` block using default attribute.
2) defining them in ```terraform.tfvars```(this will be by default used when you do apply)
3) making a seperate file like ```serevr.tfvars```(not used by default unless you use ```terraform apply -var-file=<file_name>```)
4) Defingn varibales in ````<anyname>.auto.tfvars```(by default taken by tf)
5) giving them as env or inline ```terrafom apply -val="instance_type=t2.micro"``` or ``` terraform apply -var-file=<file_name>```

tf has order of precidence if varible types are sued at a all at single time

````5>4>3>2>1````

you can usevariables in your resoyrce block using ```var.variable_name```

validate is used inside varibale to check if the given varible satisfies the conditon or not.
it has two things codition and error, if cond is not satified error message is printed


Note: In varible inheritance only child can inherit from parent varibles. ie if you are writing module and have varible name in child.tf it will not be recognized

from where are you runiing you need have .tfvars

#note you cant define variabels inside variabels block unlike locals

---

For output 

```sh
terraform output
```
in json
```sh
terraform output --json public
```
raw output so  ot can be ued in commands like ssh\
```sh
terraform output --raw public
```