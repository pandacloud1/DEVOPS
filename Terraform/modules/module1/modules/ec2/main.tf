# Create Security Group
resource "aws_security_group" "my_sg" {
  name = "Apache-Security-Group"
  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  ingress {
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  ingress {
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "ALL"
  }

}

# CREATE EC2 INSTANCE
resource "aws_instance" "my-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids =  [aws_security_group.my_sg.id]

  provisioner "local-exec" {
    command = "echo WE ARE SETTING UP APACHE WEBSERVER"
  }

  provisioner "remote-exec" {
    connection { 
      type = "ssh"
      private_key = file("./Linux_key.pem")
      user = var.user
      host = aws_instance.my-ec2.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo echo 'THIS IS MY WEBSERVER' | sudo tee /var/www/html/index.html"
    ]
  }

  tags = {
     Name = var.tags
  }
}
