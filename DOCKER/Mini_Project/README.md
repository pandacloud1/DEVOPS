---
# **DOCKER MINI PROJECT**
---
![Docker_Mini_project](https://github.com/user-attachments/assets/4d1e0133-cec0-46cf-b92b-07cd3e8bfd44)

## Objective:
Pulling content from Github & exposing through container.
Tools used: Apache, Git, Docker

## Instructions:
1. Create EC2 instance & enable required ports (eg. 22, 80, 3001, 3002, 3003) in the security group
2. Install Docker
   * *(https://github.com/pandacloud1/DEVOPS/tree/main/Installation_Scripts/Docker)*
3. Create Dockerfile as below: 
   * Install Git, Apache
   * Pull content from Github
   * Copy the content to /var/www/html/ location
   * Start Apache service 
4. Create Docker image from 'Dockerfile'
5. Create Container from Docker image exposing required port of the container with the local machine
6. Access the content from the browser using <ec2_public_IP>

- *Docker_Commands:* *(https://github.com/pandacloud1/DEVOPS/blob/main/DOCKER/Mini_Project/Docker_commands)*
