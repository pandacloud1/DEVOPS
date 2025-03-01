# Dockerfile
FROM ubuntu:22.04
# Install Apache & Git
RUN apt update && apt install -y apache2 git     

# Pull content from Github
RUN git clone https://github.com/pandacloud1/webapp1.git 

# Add content inside html directory
RUN cp -R webapp1/* /var/www/html/

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 (default Apache port)
EXPOSE 80

# ------------------
# Docker-Commands
# ------------------
sudo docker build -t pandacloud/webapp .       #(build image from Dockerfile)
sudo docker login -u <username>                #(Login to Dockerhub, enter password)
sudo docker push pandacloud/webapp:latest      #(Push image to Dockerhub, use this image in your deployment.yaml file)

# Getting error "Error - requested access to the resource is denied"?
# Ref: https://forums.docker.com/t/docker-push-error-requested-access-to-the-resource-is-denied/64468/5

# Try to delete the config file & relogin again
rm -rf ~/.docker/config.json

# Re-login
sudo docker login -u <username>                #(Login to Dockerhub, enter password)
