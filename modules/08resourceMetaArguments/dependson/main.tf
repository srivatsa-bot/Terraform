#depends on will specify to a particular resource that it should wait until other resource is intilized
#ed:- ec2 depedns upon vpc creation
#to assign role to aws ec2 an instacnce profile is created when role is created

#first create role

resource "aws_iam_role" "test_role" {
  name = "test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "",
              "Effect": "Allow",
              "Principal": {
                  "Service": "ec2.amazonaws.com"
              },
              "Action": "sts:AssumeRole"
          }
      ]
  }
  ) 
}

#tou can attach policy to insatacnce using aws_instacne_policy, in cli,gui it is created automatically
#depends on role creation
resource "aws_iam_instance_profile" "profileForMyserevrDepends" {
  name = "test382555"
  role = aws_iam_role.test_role.name #we want name of the role which i sstring
  depends_on = [ aws_iam_role.test_role ]
}

# create server, depends on role creationa dn instaacne_profile
resource "aws_instance" "myserverDepends" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro" 
  tags = {
    # Name = local.tag_name
    # or
    Name  = "depends_on_exmaple" #you can also use in line code
  }

  depends_on = [ aws_iam_role.test_role, aws_iam_instance_profile.profileForMyserevrDepends ]

  iam_instance_profile = aws_iam_instance_profile.profileForMyserevrDepends.name # aws expects name

}

output "val" {
  value=aws_instance.myserverDepends.public_ip
}













