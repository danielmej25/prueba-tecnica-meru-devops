module "web_server" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
  vpc_id        = var.vpc_id

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  tags          = var.tags
}
