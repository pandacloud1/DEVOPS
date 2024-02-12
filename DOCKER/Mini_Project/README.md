---
# **DOCKER MINI PROJECT**
---

![image](https://github.com/pandacloud1/DEVOPS/assets/134182273/e7a14622-fc73-4036-b64c-e41f0f175b07)

## Objective:
Pulling content from Github & exposing through container

## Instructions:
1. Create EC2 instance & enable required ports (eg. 22, 80, 8080) in the security group
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

- *Dockerfile:* *(https://github.com/pandacloud1/DEVOPS/blob/main/DOCKER/Mini_Project/Dockerfile)*
- *Docker_Commands:* *(https://github.com/pandacloud1/DEVOPS/blob/main/DOCKER/Mini_Project/Docker_commands)*

