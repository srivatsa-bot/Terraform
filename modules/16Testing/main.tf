resource "aws_s3_bucket" "buk" {
  bucket = var.buk_nam
}

resource "aws_s3_bucket" "buk2" {
  bucket = "eefwfjqqoin"
}
variable "buk_nam" {
  type = string
  #   default = "fnfefonfine"
  #   sensitive = true
}

output "bucket" {
  value       = aws_s3_bucket.buk.id
  description = "The name of the S3 bucket"

}

resource "null_resource" "nuke" {
  triggers = {
    id = timestamp()
  }

  
}
