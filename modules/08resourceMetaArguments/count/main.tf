 resource "aws_s3_bucket" "example" {
    count = 2
    bucket = "my-tf-test-bucket-38225-${count.index}"
}

#count will specify howmany bucets you are going to make and you will also get count.index which tells the index of resource we are wrking in the presetn

#fro output you can use list naming convention with index, if want to get all detils use [*]

output "val08" {
  value = aws_s3_bucket.example[*]
}