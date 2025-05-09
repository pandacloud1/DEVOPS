# REF: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html
#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
# Add ec2-user to the docker group so that Docker commands can be run w/o using sudo.
sudo usermod -aG docker $USER && newgrp docker  #(add normal user 'docker')
# sudo usermod -aG docker ec2-user
# To avoid below permission error
# Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
sudo chmod 777 /var/run/docker.sock


