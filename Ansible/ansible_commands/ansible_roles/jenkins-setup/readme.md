# JENKINS ROLE

## Allow Roles in Ansible configuration file
```sh
sudo vi /etc/ansible/ansible.cfg
```
Add below
```sh
roles_path = /etc/ansible/roles
```

## Create Jenkins Role
```sh
cd /etc/ansible/roles
```
```sh
sudo ansible-galaxy init jenkins
```
Install tree package in your Linux system
```sh
sudo yum install tree –y        	# (OR) sudo apt install tree -y
```
Run 'tree' command, it will show below output
```sh
tree
```
```sh
jenkins/
├── defaults/
│   └── main.yml        # Default variables (jenkins_node_ip)
├── handlers/
│   └── main.yml        # Handlers for starting/restarting services
├── tasks/
│   └── main.yml        # Tasks for installing Jenkins
└── vars/
    └── main.yml        # Predefined variables (if needed)
```

## Add defaults
```sh
cd /etc/ansible/roles/jenkins
```
```sh
sudo vi defaults/main.yml
```
```yaml
---
jenkins_node_ip: "172.31.14.245"  # Enter your Node's Private IP here
...
```

## Add handlers
```sh
sudo vi handlers/main.yml
```
```yaml
---
# Restart Jenkins service when notified by the tasks
- name: Restart Jenkins service
  systemd:
    name: jenkins
    state: restarted
    enabled: true
...
```
## Add tasks
```sh
sudo vi tasks/main.yml
```
```yaml
---
# Install Jenkins and Java using YUM
- name: Update all packages
  yum:
    name: '*'
    state: latest
  when: ansible_host == jenkins_node_ip

- name: Add Jenkins repository
  get_url:
    url: "{{ jenkins_repo_url }}"
    dest: /etc/yum.repos.d/jenkins.repo
    mode: '0644'
  when: ansible_host == jenkins_node_ip

- name: Import Jenkins GPG key
  rpm_key:
    state: present
    key: "{{ jenkins_gpg_key_url }}"
  when: ansible_host == jenkins_node_ip

- name: Upgrade all packages
  yum:
    name: '*'
    state: latest
  when: ansible_host == jenkins_node_ip

- name: Install Java 17 (Amazon Corretto)
  yum:
    name: "{{ java_package }}"
    state: present
  when: ansible_host == jenkins_node_ip

- name: Install Jenkins
  yum:
    name: jenkins
    state: present
  when: ansible_host == jenkins_node_ip
  notify: Restart Jenkins service

- name: Enable Jenkins service to start at boot
  systemd:
    name: jenkins
    enabled: true
  when: ansible_host == jenkins_node_ip
...
```

## Add variables (vars)
```sh
sudo vi vars/main.yml
```
```yaml
---
# This file contains static variables required for the installation

jenkins_repo_url: "https://pkg.jenkins.io/redhat-stable/jenkins.repo"
jenkins_gpg_key_url: "https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key"
java_package: "java-17-amazon-corretto"
...
```
## Create your main jenkins playbook
Note: You can create the playbook in any path, the config file will automatically fetch the roles as per the path defined
```sh
vi jenkins-role.yml
```
```yaml
---
- name: Installing Jenkins using Ansible Roles
  hosts: all
  become: true
  roles:
    - jenkins
...
```
```sh
ansible-playbook jenkins-role.yml
```
