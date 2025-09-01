# DEFINE THE VARIABLES BLOCK

## Create EC2 instance using variables
```sh
variables.tf
```
```hcl
variable "ami" {
    default = "ami-0360c520857e3138f"
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

## Create multiple EC2 instances using variables
```hcl
variable "ami" {
  default = "ami-0360c520857e3138f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tags" {
  type = list
  default = ["1.Web Server", "2.App Server", "Database Server"]
}

resource "aws_instance" "my_instance" {
  ami = var.ami
  instance_type = var.instance_type
  count = 3
  tags = {
    Name = var.tags[count.index]
  }
}
```

```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
