#using only-s3 iam user who can only create s3 bucket to create ec2 ---> leads to error

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
      configuration_aliases = [aws.onlys3]
    }
  }
}

resource "aws_s3_bucket" "test" {
    provider = aws.onlys3
    bucket = "ejfneofkeo"
}