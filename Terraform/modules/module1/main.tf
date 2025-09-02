# Main module to call the child module

module "my-webserver" {
  source = "./modules/ec2"
}
