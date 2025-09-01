# ANSIBLE ADHOC COMMANDS
Note:
* Syntax -> `ansible <node> -m <module> -a <argument>`
* -m : module
* -a : argument

## Check connectivity of the Nodes
```sh
ansible all -m ping              
```

## Check hostnames of the Nodes
```sh
ansible all -a "hostname"            
```

## List all files & directories in Nodes
```sh
ansible all -a "ls -a"               
```
## Create a file `test` in all Nodes
```sh
ansible all -m file -a "path=/tmp/test state=touch"
```
## Create a directory `/tmp/testdir` in all Nodes
```sh
ansible all -m file -a "path=/tmp/testdir state=directory"
```
## Copy a local file `my-file` to `/tmp` on the Nodes.
```sh
echo "This is Master File" > my-file
ansible all -m copy -a "src=/home/ansadmin/my-file dest=/tmp/"
```
## Install apache on the Nodes (Amazon Linux)
```sh
ansible all -m yum -a "name=httpd state=present"
ansible all -m service -a "name=httpd state=started
```
## Remove apache on the Nodes (Amazon Linux)
```sh
ansible all -m yum -a "name=httpd state=absent"
```
## Install apache on the Nodes (Ubuntu)
```sh
ansible all -m apt -a "name=apache2 state=present"
ansible all -m service -a "name=apache2 state=started
```
## Remove apache on the Nodes (Ubuntu)
```sh
ansible all -m yum -a "name=apache2 state=absent"
```
## Check free memory
```sh
ansible all -m shell -a "free -m"
```
## Reboot the remote Nodes
```sh
ansible all -m reboot
```
## Check listening ports
```sh
ansible all -m shell -a "netstat -tuln"
```
