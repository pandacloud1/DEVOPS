---
# **K8S MINI PROJECT**
---
![K8s_Mini_project]()

## Objective:
Pulling custom docker image in Kubernetes pods & exposing it outside.

## Instructions:
1. Create EC2 instance (Amazon Linux 2) & enable all traffic in the security group
2. Install Docker & K8s
   * *(https://github.com/pandacloud1/DEVOPS/tree/main/KUBERNETES/Installing%20K8s%20using%20Kubeadm/Amazon_Linux2)*
3. Create custom Dockerfile as below: 
   * Install Git, Apache
   * Pull content from Github
   * Copy the content to /var/www/html/ location
   * Start Apache service 
4. Create your custom Docker image from 'Dockerfile' & push it to Dockerhub
5. Use the Docker image in your deployment.yaml file
   * *(https://github.com/pandacloud1/DEVOPS/blob/main/KUBERNETES/Mini_Project/deployment.yaml)*
6. Expose the pod using service.yaml file
6. Access the content from the browser using <ec2_public_IP>

- *Docker_Commands:* *(https://github.com/pandacloud1/DEVOPS/blob/main/DOCKER/Mini_Project/Docker_commands)*
