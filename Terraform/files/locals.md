# CREATE EC2 USING LOCALS BLOCK
```hcl
locals {
  my_tag = {
    Name = "Jenkins-Server",
    Type = "Production",
    Owner = "Alexa",
  }
}
# USE THE LOCAL VARIABLES WITHIN THE RESOURCE BLOCK
resource "aws_instance" "MyServer" {
  ami = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  tags = local.my_tag
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
