# TERRAFORM PROVISIONERS

Note:
* Copy your pem key in the same location as your terraform code
* Local provisioner `local-exe` is used to run commands in your local machine
* Remote provisioner `remote-exec` is used to run commands in your remote machine (host)

## STEP-1: CREATE A SECURITY GROUP
```hcl
resource "aws_security_group" "my_security_group" {
  name = "my-security-group"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = “ALL”
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```
## STEP-2: CREATE AN EC2 INSTANCE USING SECURITY GROUP & THE PEM KEY
Use `depends_on` meta-argument to create EC2 only after SG is created
```hcl
resource "aws_instance" "my_ec2_instance" {
  ami = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"

  # Use `depends_on` meta-argument
  depends_on = [aws_security_group.my_sg]       # Ensures security group is created first

  # Use SG created above
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  key_name = "My-key" 		                      # Enter your key-name here, do not use extension '.pem’
  tags = {
    Name = "WEBSERVER"
  }

  # STEP-2.1: USE 'LOCAL-EXEC' TO PRINT A MESSAGE
  # USING LOCAL-EXEC PROVISIONER
  provisioner "local-exec" {
    command = "echo 'WE ARE INSTALLING APACHE IN AWS EC2 INSTANCE’”
  }

  # STEP-2.2: USE 'REMOTE-EXEC' PROVISIONER TO SETUP APACHE PACKAGE
  provisioner "remote-exec" {
  # ESTABLISHING SSH CONNECTION WITH EC2
    connection {
      type = "ssh"
      private_key = file("./My-key.pem")     # enter key-name with '.pem', store it in the same folder as your code
      user = "ec2-user"
      host = self.public_ip
    }
    # INSTALLING APACHE IN EC2
    inline = [
      "sudo yum update –y && yum install -y httpd",
      "sudo service httpd start",
      “sudo service httpd status”,
      "sudo chkconfig httpd on",
      "sudo echo 'MY-WEBSERVER' | sudo tee /var/www/html/index.html"
     ]
  }
}
```

## STEP-3: USE OUTPUT BLOCK TO GET THE PUBLIC IP OF EC2
```hcl
output "ec2_public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
}
```

```sh
terraform apply --auto-approve
```
```sh
terraform destroy --auto-approve
```
