

#storing in s3


# terraform {
#   backend "s3" {
#     bucket = "hasikiks23221r"
#     key    = "/home/srivatsa/golang-lco/Terraform/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }


resource "aws_s3_bucket" "name" {
  bucket = "eoiehfhoiehfoi"
  timeouts {

  }
}
