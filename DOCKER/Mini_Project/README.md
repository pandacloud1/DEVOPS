==========================================
# DOCKER MINI PROJECT
==========================================

==========================================
# Objective:
==========================================
# Pulling content from Github & exposing through container

==========================================
# Instructions:
==========================================
# 1. Create EC2 instance & enable ports 22, 80, 8080 in the security group
# 2. Install docker
# 3. Create Dockerfile as below:
     # Install git, apache
     # Pull content from Github
     # Copy the content to /var/www/html/ location
     # Start apache service
# 4. Create docker image from 'Dockerfile'
# 5. Create container from Docker image exposing required port of the container with the local machine
# 6. Access the content from the browser using <ec2_publicIP>
