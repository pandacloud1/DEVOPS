# Ansible Configuration for Amazon Linux 2
NOTE: The below steps to be performed in the master & the nodes.

## Set hostname for master & nodes (OPTIONAL)
Run in Master
```sh
sudo su -
hostnamectl set-hostname master
bash
```

Run in Nodes
```sh
sudo su -
hostnamectl set-hostname node1
bash
```

## Step1: Create a user & set password.
```sh
yum update -y
adduser ansadmin      
passwd ansadmin
```

## Step2: Give sudo priviledges to the user
### NOTE:
1. You cannot install or update packages being a normal user (eg. ansadmin)
2. Try running `sudo apt update -y` & it will show permission error.
3. Add the normal user (eg. ansadmin) to sudoers file, try running `sudo apt update -y` & it will work!
4. The sudoers file should be edited with care. Using a regular text editor like nano or vi can lead to syntax errors. `vi /etc/sudoers`
5. To safely edit the sudoers file, use the `visudo` command, which checks the file for syntax errors before saving

```sh
visudo
```

Add the below line
```sh
ansadmin ALL=(ALL) NOPASSWD: ALL
```

## Step3: Enable 'Password Authentication' in the SSH server's configuration file 
Edit SSH server configuration file
```sh
vi /etc/ssh/sshd_config     
```
Set parameter `PasswordAuthentication yes` <br>
Note: 
1. Password authentication is enabled so that we can copy the ssh keys from master to node using a password
2. Once the keys are copied, we can disable password authentication for added security

## Step4: Restart the SSH service.
```sh
service sshd restart         
```
