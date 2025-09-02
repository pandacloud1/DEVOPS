# Output block to get the EC2 Public IP
output "Public_IP" {
  value = aws_instance.my-ec2.public_ip
}
