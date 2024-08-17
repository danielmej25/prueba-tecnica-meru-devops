output "instance_ec2_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.this.public_ip
}
