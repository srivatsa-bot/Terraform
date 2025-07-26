# variable "tag_name" {
#   type = string
# }
locals {
  tag_name="damn"
}

#aws resource
resource "aws_instance" "myserver" {
  ami           = "ami-0d0ad8bb301edb745"
  instance_type = "t2.micro"

  tags = {
    # Name = local.tag_name
    # or
    Name  = "Server-${local.tag_name}" #you can also use in line code
  }
}


output "id" {
  value = {
    ami = aws_instance.myserver.ami
  }
}