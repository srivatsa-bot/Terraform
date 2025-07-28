resource "aws_instance" "myserver" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro" 
  tags = {
    # Name = local.tag_name
    # or
    Name  = "Server-${var.name}" #you can also use in line code
  }
}

# locals {
#   name="dawadwd"
# }

# important distinction
variable "name" {
  type = string
  description = "Name of my server"
  # default = "myserver" this is dangerous, tf will always take this value unless you pass it inline through terminal or tfvars or .auto.tfvars
  validation {
    condition = length(var.name)>0
    error_message = "Name should be greater than zero."
  }

}

#the above one only owrks if this is in the root directory, tf only auto loads .tfvasr file in root directory
#so we can send varibles from child to parent 
#so we need to define the varible block in root main.tf and pass it through module

# module "_variables" {
#   source = "./modules/06variables"
#   name = "doom"
# }

# but note here we are defing varibale in both module tf file and root tf fie
# this is ecpected as to make modules truley independent
# so tf treets every tf file as different module. there is no concept as ooops here
#so when you do inti it will ask varibles from root main.tf and then will pass it through module and in moudle tf we define a variable so it can know weather it should take it or not
# ?its for the module tf file to understand whats its taking as variable


# for locals yu dont need to sedn values from parent to child 


output "public" {
  value = aws_instance.myserver.public_ip
}

#this re-definig behaviour is same for output, you need to define output block here
# but if you are calling tf from root dir, you need to make seperate output varibale and reference the module output from there
# eg:
# output "public" {
#   value = module._variables.public
# }
