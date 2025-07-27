data sourcesare used to fetch the details about resources that are provisoned using terraform.

eg you have a ec2 instance provisoned by consle but you awnt to get public ip of it you can use dta block and  give insatnce id in it. and use the data source to detch the ip

```sh
data "aws_instance" "fetcher" {
  instance_id = "i-instanceid"
}

output "pubip" {
  value = data.aws_instance.fetcher.public_ip
}
```