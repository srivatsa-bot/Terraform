we are using ```terrafrom comsole```(a playground to lean hcl syntax )
```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform console
> var.example
"damu"
>  

how to use condition siwth string
```
1) using ternery operator 
```sh
condition ? true_val : false_val
```

```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform console
> var.example
"sri"
> var.example == "sri" ? "Hurray" : "Boo"
"Hurray"
```

2) use if else (directive){Note this one only works inside strings for some reason just likei interpoltion "${}"}
```sh
%{if condition}true_val%{else}false_val%{endif}
```

```sh
> "value: ${var.example == "sri" ? "Hurray" : "Boo"}"
"value: Hurray"
```

---


Now for loops(not for_each)

it can support list,tuple,sets,maps objects

synatx to print list items
```sh
[for s in var.list : upper(s)]  #<-- breackets specify output will be list, for mp output us e{}
```
example to print in map format
```sh
> {for s in var.example : s => upper(s)}
{
  "A" = "A"
  "sri" = "SRI"
}
```

eg:
```example = ["srivbatsa","eefef","eefe"]``` defind in .tfvars
```sh
> [for var in var.example: var]
[
  "srivbatsa",
  "eefef",
  "eefe",
]
>  
```

eg using map:
```
example = {
    name = "sri"
    grade = "A"
}
```
output 
```sh
> [for key, value in var.example : "${key} = ${value}"]
[
  "grade = A",
  "name = sri",
]
>  
```

using if inside for
```sh
> [for s in var.example : s if s=="eefe"]
[]
> [for s in var.example : s ]
[
  "A",
  "sri",
]
> [for s in var.example : s if s=="eefe"]
[]
> [for s in var.example : s ]
[
  "A",
  "sri",
]

```

---
splat operator[*] used with list a lot
```sh
srivatsa@pop-os:~/golang-lco/Terraform$ terraform console
> var.example
> var.example
tolist([
  {
    "name" = "sri"
  },
  {
    "name" = "ravi"
  },
])
>  
```

to print the keys
```sh
> [for m in var.example: m.name]
[
  "sri",
  "ravi",
]
>  
```

insted of for we can use [*]
```sh
> var.example[*].name
tolist([
  "sri",
  "ravi",
])
>  
```



