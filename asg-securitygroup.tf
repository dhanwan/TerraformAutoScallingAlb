module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name  = "autoscallingSg"
  description = "Allow http and ssh"
  vpc_id  = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = ["http-80-tcp","ssh-tcp"]
  egress_rules = ["all-all"]
  depends_on = [ module.vpc ]

  
}