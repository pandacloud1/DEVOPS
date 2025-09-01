# DATA BLOCK

Fetch the existing security group from AWS
```hcl
data "aws_security_group" "existing_SG" {
  id = "<SG-Id>" # Replace with your existing security group id
}
```

Create an EC2 instance referencing the existing security group
```hcl
resource "aws_instance" "my_instance" {
  ami = "ami-018ba43095ff50d08"
  instance_type = "t2.micro"
  key_name = "<key-name>"           # Add your pem key name w/o '.pem' extension
  # Reference the existing security group in the EC2 block
  vpc_security_group_ids = [data.aws_security_group.existing_SG.id]
    tags = {
    Name = "MyServer"
  }
}
```
```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
