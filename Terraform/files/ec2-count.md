# CREATE 3 EC2 INSTANCES WITH NAMES SERVER1 TO SERVER3 (USING 'COUNT')

```yaml
resource "aws_instance" "MyServer" {
  ami = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "Server${count.index+1}"
}
```

Create the resource
```sh
terraform apply --auto-approve
```

Delete the resource
```sh
terraform destroy --auto-approve
```
