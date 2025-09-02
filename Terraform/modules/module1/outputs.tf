# Output block to get the EC2 public IP from the child module
output "Public_IP" {
  value = module.my-webserver.Public_IP
}
