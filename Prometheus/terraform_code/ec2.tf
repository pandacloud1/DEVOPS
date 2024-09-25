# ------------------------------------------------------
# TERRAFORM CODE TO CREATE PROMETHEUS EC2 INSTANCE
# ------------------------------------------------------

# DEFINE PROVIDER
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

# DEFINE REGION
provider "aws" {
  region = "us-east-1"
}

# STEP1: CREATE SG
resource "aws_security_group" "my-sg" {
  name        = "My-Webserver-SG"
  description = "Allow SSH, HTTP, HTTPS"
  
  # Define inbound rules for Port 22
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define inbound rules for Port 80
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define inbound rules for Port 9090
  # Port 9090 is required for Prometheus
  ingress {
    from_port       = 9090
    to_port         = 9090
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  # Define inbound rules for Port 9100
  # Port 9100 is required for Node Manager
  # Node Manager is used to check CPU usage & RAM
  ingress {
    from_port       = 9100
    to_port         = 9100
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  # Define outbound rules to allow all
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# STEP2: CREATE EC2 USING PEM & SG
resource "aws_instance" "my-ec2" {
  ami = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
  key_name = "Linux-Key"          # Replace with your key-name
  vpc_security_group_ids = [aws_security_group.my-sg.id]

  tags = {
    Name = "Prometheus-Server"
  }
}

# STEP3: GET EC2 USER NAME AND PUBLIC IP 
output "Prometheus-Server-Access" {
  value = "ubuntu@${aws_instance.my-ec2.public_ip}"
}

# -----------------------
# Commands
# -----------------------
# Create the EC2
# terraform apply --auto-approve

# Delete the EC2 after the practical
# terraform destroy --auto-approve
