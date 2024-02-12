#!/bin/bash
# REF: (https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)

sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Generate Jenkins initial login password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
	  
# Get Public IP of Jenkins
curl ifconfig.me
