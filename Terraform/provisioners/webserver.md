# TERRAFORM PROVISIONERS
Install Apache in your host using local & remote exec provisioners

Note:
* Copy your pem key in the same location as your terraform code
* Use `key_name = file("./key.pem")` to call your key with .pem extension.
* Local provisioner `local-exe` is used to run commands in your local machine
* Remote provisioner `remote-exec` is used to run commands in your remote machine (host)

## 1. CREATE VARIABLES
Store variables in a different file named `variables.tf`
```sh
variables.tf
```
```hcl
# DEFINE DEFAULT VARIABLES
variable "ami" {
    default = "ami-00ca32bbc84273381"
    description = "Amazon Linux 2023"
}  

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
  default = "my-key"
}

variable "tags" {
  default = "Apache-Server"  
}
```

## 2. CREATE SECURITY GROUP
```sh
main.tf
```
```hcl
resource "aws_security_group" "my_sg" {
  ingress {
    description = "Allow SSH port"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP port"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Allow HTTPS port"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "ALL"
    cidr_blocks = ["0.0.0.0/0"]    
  }
}
```

## 3. RESOURCE BLOCK: EC2 INSTANCE
```hcl
resource "aws_instance" "my_instance" {
  depends_on = [ aws_security_group.my_sg ]
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name                      # Use without '.pem' extension
  
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = var.tags
  }  

  # 2.1: RUN LOCAL PROVISIONER
  provisioner "local-exec" {
    command = "echo 'WE ARE INSTALLING APACHE'"
  }

  # 2.2: RUN REMOTE PROVISIONER
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      private_key = file("./my-key.pem")      # Use with '.pem' extension
      user = "ec2-user"
      host = self.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "sudo echo 'THIS IS MY WEBSERVER' | sudo tee /var/www/html/index.html"
    ]
  }
}
```

## 4. OUTPUT BLOCK
```hcl
output "EC2_Public_IP" {
  value = aws_instance.my_instance.public_ip
}
```
```sh
terraform apply --auto-approve
```
Get the EC2-PublicIP & access your apache application from the browser

```sh
terraform destroy --auto-approve
```
