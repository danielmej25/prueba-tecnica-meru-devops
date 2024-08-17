output "instance_ec2_id" {
  description = "ID of the EC2 instance"
  value       = module.web_server.instance_ec2_id
}

output "instance_ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.web_server.public_ip
}
