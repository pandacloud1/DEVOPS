# ANSIBLE ADHOC COMMANDS
Note:
* Syntax -> `ansible <node> -m <module> -a <argument>`
* -m : module
* -a : argument

## Check connectivity of the Nodes
```sh
ansible -m ping all             
```

## Check hostnames of the Nodes
```sh
ansible all -a "hostname"            
```

## List all files & directories in Nodes
```sh
ansible all -a "ls -a"               
```
## Create a directory /tmp/testdir on all hosts
```sh
ansible all -m file -a "path=/tmp/testdir state=directory"
```
## Copy a local file to /tmp/ on the target machines.
```sh
su ansadmin
cd ~
echo "This is Master File" > master-file
ansible all -m copy -a "src=/home/ansadmin/master-file dest=/tmp/"
```
## Check free memory
```sh
ansible all -m shell -a "free -m"
```
## Reboot the remote hosts
```sh
ansible all -m reboot
```
## Check listening ports
```sh
ansible all -m shell -a "netstat -tuln"
```
