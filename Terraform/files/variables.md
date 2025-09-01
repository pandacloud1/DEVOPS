# DEFINE THE VARIABLES BLOCK
```sh
variables.tf
```
```hcl
variable "ami" {
    default = "ami-04aa00acb1165b32a"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "tags" {
    default = "My-Server"
}
resource "aws_instance" "MyServer" {
  ami = var.ami
  instance_type = var.instance_type
  tags = { Name = var.tags }
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
