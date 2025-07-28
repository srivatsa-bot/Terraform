data "aws_instance" "ami" {
  instance_id = "i-00b807cd7479d3fa7"
}


output "info" {
  description = "prints all the info abut ec2 instacne withh particular id"
  value = data.aws_instance.ami.public_ip
}
#this will exrport all the data related to ec2 instacne with that specif id
#you can output all or choose a specifc one