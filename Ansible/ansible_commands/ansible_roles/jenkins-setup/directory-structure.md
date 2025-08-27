# Directory structure for Jenkins Role
Install tree package in your Linux system
```sh
cd /etc/ansible/roles
```
```sh
sudo ansible-galaxy init jenkins
```
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
