# variable "tag_name" {
#   type = string
# }
locals {
  tag_name="apache"
}

#aws resource
resource "aws_instance" "myserver" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  user_data = file("${path.module}/apache.sh")  
  tags = {
    # Name = local.tag_name
    # or
    Name  = "Server-${local.tag_name}" #you can also use in line code
  }
}

resource "aws_instance" "myserver22" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  user_data = file("${path.module}/apache.sh")  
  tags = {
    # Name = local.tag_name
    # or
    Name  = "apache-2" #you can also use in line code
  }
}


output "id" {
  value = {
    ip1 = aws_instance.myserver.public_ip
    ip2 = aws_instance.myserver22.public_ip
  }
}