data "aws_instance" "fetcher" {
  instance_id = "i-0f74f1d9f3f52266d"
}

output "pubip" {
  value = data.aws_instance.fetcher.public_ip
}