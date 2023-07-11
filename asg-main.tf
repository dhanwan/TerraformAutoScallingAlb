
resource "aws_launch_template" "this" {
    name = "${var.project_name}-template"
    image_id = data.aws_ami.ami.image_id
    instance_type = var.instance_type
    user_data = filebase64("${path.module}/ec2init.sh")

    key_name = aws_key_pair.asg-deploy.key_name

 network_interfaces {
    associate_public_ip_address = true
    security_groups = [module.sg.security_group_id]
    # vpc_security_group_ids = [ module.sg.security_group_id ]
  }
    # vpc_security_group_ids = [ module.sg.security_group_id ]
    
    tags = local.tags

}

#  module "autoscaling" {
#   source  = "terraform-aws-modules/autoscaling/aws"
#   version = "6.10.0"
#   # insert the 1 required variable here

#   name = "${var.project_name}-asg"

#   min_size = 1
#   max_size = 2
#   desired_capacity = 1
#   wait_for_capacity_timeout = 0
#   health_check_type = "EC2"
#   vpc_zone_identifier = var.public_subnets

#   instance_refresh = {
#     preferences = {
#       checkpoint_delay = 600
#       checkpoint_percentage = [35, 70, 100]
#       instance_warmup = 300
#       min_healthy_percentage = 50
#     }
#   }
# }

resource "aws_autoscaling_group" "this" {
    name = "${var.project_name}-asg"
    min_size = "2"
    max_size = "3"
    desired_capacity = "2"
    # availability_zones = data.aws_availability_zones.available.names
    vpc_zone_identifier = module.vpc.public_subnets
    health_check_grace_period = "300"
    health_check_type = "EC2"

    launch_template {
      id = aws_launch_template.this.id
      version = "$Latest"
    }
  
}