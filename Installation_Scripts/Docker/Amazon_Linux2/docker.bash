# REF: https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
# Add ec2-user to the docker group so that Docker commands can be run w/o using sudo.
sudo usermod -a -G docker ec2-user
sudo chmod 700 /var/run/docker.sock
