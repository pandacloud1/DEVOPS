## Install Jenkins on Ubuntu 🛠️ 
Ref: https://www.jenkins.io/doc/book/installing/linux/#debian-stable

### 1. **Provider Configuration**
```hcl
# DEFINE PROVIDER
provider "aws" {
  region = "us-east-1"
}
```

### 2. **Security Group for Jenkins**
```hcl
# CREATE SECURITY GROUP FOR JENKINS
resource "aws_security_group" "my-sg" {
  name        = "Prometheus-Grafana-SG"
  description = "Allow SSH, HTTP, HTTPS & Jenkins Port"

  ingress {
    description = "SSH Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS Port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

### 3. **EC2 Instance with Jenkins Installation**
```hcl
# CREATE AN EC2 INSTANCE & INSTALL JENKINS
resource "aws_instance" "my-ec2" {
  ami                    = "ami-0360c520857e3138f"  # Ubuntu 24.04 (us-east-1)
  instance_type          = "t2.micro"
  key_name               = "my-key"                 # Replace with your actual key name
  vpc_security_group_ids = [aws_security_group.my-sg.id]

  tags = {
    Name = "Jenkins-Server"
  }

  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./my-key.pem")  # Replace with your actual PEM file path
      host        = self.public_ip
  }

  # INSTALL JENKINS  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y curl gnupg2 fontconfig openjdk-17-jre",
      "sudo mkdir -p /etc/apt/keyrings",
      "sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "echo 'deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/' | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update -y",
      "sudo apt-get install -y jenkins",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "echo 'Jenkins Initial Admin Password:'",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }
}
```

### 4. **Output Jenkins Access Info**
```hcl
# GET THE JENKINS SERVER URL
output "Jenkins-Server-Access" {
  value = "http://${aws_instance.my-ec2.public_ip}:8080"
}
```

### Terraform Commands

```bash
terraform apply --auto-approve
```
```bash
terraform destroy --auto-approve
```
