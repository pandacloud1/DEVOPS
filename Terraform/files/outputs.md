# OUTPUT BLOCK

## Create an EC2 instance & get the PublicIP, PrivateIP & InstanceID
```sh
outputs.tf
```
```hcl
resource "aws_instance" "my_instance" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  tags = {
    Name = "My-Server"
  }
}

output "EC2_Public_IP" {
  value = aws_instance.my_instance.public_ip
}

output "EC2_Private_IP" {
  value = aws_instance.my_instance.private_ip
}

output "EC2_InstanceID" {
  value = aws_instance.my_instance.id
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```

## Get output of multiple EC2 instances using `[*]`
```sh
outputs.tf
```
```hcl
resource "aws_instance" "my_instance" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "Server${count.index+1}"
  }
}

output "EC2_Public_IP" {
  value = aws_instance.my_instance[*].public_ip
}

output "EC2_Private_IP" {
  value = aws_instance.my_instance[*].private_ip
}

output "EC2_InstanceID" {
  value = aws_instance.my_instance[*].id
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
