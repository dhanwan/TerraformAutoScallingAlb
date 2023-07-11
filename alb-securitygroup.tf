module "alb-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "alb-sg"
  description = "Allow http and https for the ALB also allow All Traffic to Ec2 Security Group"

  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = [ "0.0.0.0/0" ]
  ingress_rules = [ "https-443-tcp", "http-80-tcp" ]

  egress_rules = [ "all-all" ]

  tags = local.tags
}