# Directory structure for Jenkins Role
First, edit the ansible.cfg file to allow ansible roles
```sh
sudo vi /etc/ansible/ansible.cfg
```
Add below
```sh
roles_path = /etc/ansible/roles
```

Now let's create Jenkins Role
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
│   └── main.yaml        # Default variables (jenkins_node_ip)
├── handlers/
│   └── main.yaml        # Handlers for starting/restarting services
├── tasks/
│   └── main.yaml        # Tasks for installing Jenkins
└── vars/
    └── main.yaml        # Predefined variables (if needed)
```
