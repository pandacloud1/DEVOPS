# ====================================
# INSTALLING MINIKUBE IN UBUNTU 20.04
# ====================================
# Reference: https://minikube.sigs.k8s.io/docs/start/

# ------------------------
# PRE-REQUISITE
# ------------------------
# Docker
# Min 2GB Memory,  Min 2CPU's, Min 20GB Storage space (Use Instance_type: t2.medium)
# Ports: 22, 80, 443, 6443, 10250, 30000-32767 (Keep all ports open for practise)


# ------------------------
# INSTALL DOCKER
# ------------------------
sudo apt update -y                              #(update the OS)
sudo apt install docker.io -y                   #(install docker)
sudo service docker start    	                #(start docker service)
sudo usermod -aG docker $USER && newgrp docker  #(add normal user 'docker')
# sudo usermod -aG docker ec2-user
# To avoid below permission error
# Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
sudo chmod 777 /var/run/docker.sock

# ------------------------
# INSTALL MINKUBE
# ------------------------
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start

# ------------------------
# INSTALL KUBECTL
# ------------------------

# Install package for Kubernetes apt repository
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# In older release less than Ubuntu 22.04 below directory must be created
sudo mkdir -m 755 /etc/apt/keyrings

# Download the public signing key for the Kubernetes package repositories
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the appropriate Kubernetes apt repository
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the apt package index, install kubectl
sudo apt-get update -y
sudo apt-get install -y kubectl


# Open the below command in new tab when exposing ports
minikube tunnel
