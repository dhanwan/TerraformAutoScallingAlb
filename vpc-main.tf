
module "vpc" {


  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = data.aws_availability_zones.available.names
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.db_subnets


  create_database_subnet_group       = true
  create_database_subnet_route_table = true

  enable_dns_support   = true
  enable_dns_hostnames = true

  enable_nat_gateway = false

  tags = local.tags
}
