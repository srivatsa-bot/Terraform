data "aws_vpc" "name" {
    id = "vpc-0b2fc33df31177943"
}

#i want to open these list of ports, but in one ingress rule we can only specify one port
variable "sg" {
  default = [20,80,443,8080,8000,8008]
}

resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id      = data.aws_vpc.name.id

    dynamic "ingress" {
    for_each = var.sg
    content {
      description = "Allow TCP on port ${ingress.value}"
      from_port   = ingress.value #in for loop we will use each.value to go trhough multiple things
      to_port     = ingress.value # but in dynamic syntax we use dynamic block name to get the valies form for_each
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

    #we are allwoing every port so no need to do dynamic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # All protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
}


#other way to do the same thing
# resource "aws_security_group" "allow_tls" {
#   for_each = toset(var.sg)
  
#   name        = "allow_tls_${each.value}"
#   description = "Allow TLS inbound traffic on port ${each.value}"
#   vpc_id      = data.aws_vpc.name.id

#   ingress {
#     description = "Allow TCP on port ${each.value}"
#     from_port   = each.value
#     to_port     = each.value
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


