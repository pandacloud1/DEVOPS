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
  name        = "Prometheus-Grafana-SG"
  description = "Allow SSH, HTTP, 3000, 9090 & 9100"
  
  # Define inbound rules for Port 22
  ingress {
    description     = "SSH Port"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define inbound rules for Port 80
  ingress {
    description     = "HTTP Port"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define inbound rules for Port 3000
  # Port 3000 is required for Grafana
  ingress {
    description     = "Grafana Port"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  # Define inbound rules for Port 9090
  # Port 9090 is required for Prometheus
  ingress {
    description     = "Prometheus Port"
    from_port       = 9090
    to_port         = 9090
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  # Define inbound rules for Port 9100
  # Port 9100 is required for Node Manager
  # Node Manager is used to check CPU usage & RAM
  ingress {
    description     = "Node Manager Port"
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
  ami = "ami-0a0e5d9c7acc336f1"    # Ubuntu 22.04 (us-east-1)
  instance_type = "t2.micro"
  key_name = "Linux-Key"           # Replace with your key-name
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
