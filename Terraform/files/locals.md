# CREATE EC2 USING LOCALS BLOCK
```hcl
locals {
  my_tag = {
    Name = "My-Server",
    Type = "Web Server",
    Owner = "Alexa",
    Env = "Prod"
  }
}
# USE THE LOCAL VARIABLES WITHIN THE RESOURCE BLOCK
resource "aws_instance" "MyServer" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  tags = local.my_tag                # --> use `local` not 'locals'
}
```

```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```

NOTE
* `variables.tf` file is used to declare the default variables.
* `terraform.tfvars` file overwrites the default variables.
* If we want avoid variables to be overwritten then, we can use `locals` block.
