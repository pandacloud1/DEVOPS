# Install Docker
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
# Add user to Docker group
sudo usermod -aG docker $USER && newgrp docker

# Install Minikube
# REF: https://minikube.sigs.k8s.io/docs/start/ (Select 'Linux - RPM')
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm
sudo minikube start

# Install kubectl
# REF: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
sudo curl -LO 'https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl'
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo chmod +x kubectl
sudo mkdir -p ~/.local/bin
sudo mv ./kubectl ~/.local/bin/kubectl
