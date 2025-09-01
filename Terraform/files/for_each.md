# CREATE MULTIPLE EC2 INSTANCES USING `FOR_EACH` BLOCK

```sh
main.tf
```
```hcl
resource “aws_instance” “my_instance” {
  # Set of map
  for_each = {
    “Server1” = “t2.small”,
    “Server2” = “t2.micro”,
    “Server3” = “t2.medium”
  }
  ami = “ami-0a5c3558529277641”
  tags = {
    Name = each.key
  }
  instance_type = each.value
}
```
```hcl
output “My-Server_Public_IP” {
    value = values(aws_instance.my-ec2)[*].public_ip
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
