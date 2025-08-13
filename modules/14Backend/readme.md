so what is a backend?
a plac eto store your state fies

two types
standard(cant execute tf, only stores .tfstate)
enchanded backeend(can execute infra from state file)
|-local (files and data are stored and executed in local machine)
|-remote (files and data are stored and executed in the cloud)

---

```Note```: backedn block is stored in root main.tfinside terraform block
1) standard backend with s3

```sh
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```


Note here the state file is stored in s3, so when ever you do ```tf apply```, state file is fetched from s3 in to cache , mdifed,executed and uplodeed to s3 again 

It is recommended to enble versiong and state locking in s3


---

Timeouts 



For aws_s3_bucket, you see these options:

create (string, optional)
→ How long to wait for creation of the bucket before giving up (example: "30m")

delete (string, optional)
→ How long to wait to delete the bucket before timing out (example: "20m")

read (string, optional)
→ How long to wait for a read/describe operation (example: "5m")

update (string, optional)
→ How long to wait for update operations on the bucket (example: "30m")

eg:

```sh
resource "aws_s3_bucket" "name" {
  bucket = "eoiehfhoiehfoi"

  timeouts {
    create = "45m"
  }
}
```
