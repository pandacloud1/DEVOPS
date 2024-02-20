#!/bin/bash
# REF: (https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)
# NOTE:
# 1. Jenkins works on port 8080, so keep the port open while creating EC2 instance
# 2. Jenkins also requires Java & supports versions 11,17 & 21

sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Get Jenkins_Public_IP
ip=$(curl ifconfig.me)
port=8080
echo "Access your Jenkins here --> http://$ip:$port"

# Generate Jenkins initial login password
pass=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Your Jenkins Initial Password: $pass"

# In case if Jenkins fails to starts, try to set Java version to 11,17,21 using below command
# sudo /usr/sbin/alternatives --config java 
# (Select the relevant Java version: 11,17 or 21)
