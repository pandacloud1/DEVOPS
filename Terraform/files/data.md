# DATA BLOCK

Fetch the existing security group from AWS
```
data "aws_security_group" "existing_SG" {
  id = “<SG-Id>” # Replace with your existing security group id
}
```

Create an EC2 instance referencing the existing security group
```hcl
resource "aws_instance" "my_instance" {
  ami = "ami-018ba43095ff50d08"
  instance_type = "t2.micro"
  # Reference the existing security group in the EC2 block
  vpc_security_group_ids = [data.aws_security_group.existing_SG.id]
    tags = {
    Name = "MyServer"
  }
}
```
