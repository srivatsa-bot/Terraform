terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }

  backend "s3" {
    bucket = "statebackedn"    
    key = "./terrafomr.tfstate"
    region = "ap-south-1"
    dynamodb_table = "stateSri"
  }
 
 # backend "remote" {
#     bucket = 
#   }
      
}

provider "aws" {
  # Configuration options
  profile = "default"
  region = "ap-south-1"
}


resource "aws_instance" "myserver" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  tags = {
    # Name = local.tag_name
    # or
    Name = "hbdwbwd" #you can also use in line code
  }
}

# Data source to read remote state from S3 backend
data "terraform_remote_state" "remote_instance" {
  backend = ""
  config = {
    bucket = "statebackedn"
    key    = "./terrafomr.tfstate"
    region = "ap-south-1"

  }
}

# Output the public IP from the remote state
output "remote_public_ip" {
  value = "${data.terraform_remote_state.remote_instance.outputs.current_public_ip} - from data"
  description = "Public IP address from remote state"
}

# Output the public IP from current instance
output "current_public_ip" {
  value = "${aws_instance.myserver.public_ip} - from outpu"
  description = "Public IP address of the current EC2 instance"
}



