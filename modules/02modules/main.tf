module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tf-vpc"
  cidr = "12.0.0.0/16"

  azs             = ["ap-south-1a"]
  private_subnets = ["12.0.1.0/24"]
  public_subnets  = ["12.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false
  enable_dns_hostnames = false

  tags = {
    Terraform = "true"
    Environment = "prod"
  }

}

output "vpc_id" {
  value = module.vpc.default_vpc_id
}