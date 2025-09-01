# CREATE MULTIPLE EC2 WITH DIFFERENT INSTANCE TYPE USING `FOR_EACH` BLOCK

```sh
main.tf
```
```hcl
resource "aws_instance" "my_instance" {
  # Set of map
  for_each = {
    "Server1" = "t2.small",
    "Server2" = "t2.micro",
    "Server3" = "t2.medium"
  }
  ami = "ami-0360c520857e3138f"
  tags = {
    Name = each.key
  }
  instance_type = each.value
}
```
```sh
outputs.tf
```
```hcl
output "My-Server_Public_IP" {
    value = values(aws_instance.my-ec2)[*].public_ip
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```

Output <br>
<img width="877" height="252" alt="image" src="https://github.com/user-attachments/assets/79862723-9439-40ce-bad9-53278238b9f6" />
