resource "aws_s3_bucket" "test3825" {
  bucket = "ipnfouwefi"
  lifecycle {
    prevent_destroy = false

  }
}