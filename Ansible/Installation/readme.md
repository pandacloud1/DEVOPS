# Installing Ansible in Ubuntu
#### Ref: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu 

```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
ansible --version
```

# Installing Ansible in Linux
#### Ref: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-fedora-linux 

```bash
sudo dnf install ansible
sudo dnf install ansible-core
sudo dnf install -y ansible-collection-community-general
ansible --version
```
