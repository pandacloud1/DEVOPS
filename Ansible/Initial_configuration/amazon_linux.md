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

## Step-1: Create a user & set password.
```sh
yum update -y
adduser ansadmin      
passwd ansadmin
```

## Step-2: Give sudo priviledges to the user
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

## Step-3: Enable 'Password Authentication' in the SSH server's configuration file 
Edit SSH server configuration file & set parameter `PasswordAuthentication yes`
```sh
vi /etc/ssh/sshd_config     
```

Note: 
1. Password authentication is enabled so that we can copy the ssh keys from master to node using a password
2. Once the keys are copied, we can disable password authentication for added security.

## Step-4: Restart the SSH service.
```sh
service sshd restart         
```


# Passwordless Authentication
## Step-1: Generate SSH Keys on the Master 
```bash
su ansadmin
ssh-keygen -t rsa
# OR
# ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
````

## Step-2: Copy SSH Key from Master to Nodes

This will prompt for the **password** the first time. Once the key is copied, passwordless SSH is established.

```bash
ssh-copy-id ansadmin@<node1-private-ip>          # copy ssh keys from master to node1  
ssh-copy-id ansadmin@<node2-private-ip>          # copy ssh keys from master to node2

ssh ansadmin@<node1-private-ip>                  # connect master with node1
exit                                             # exit from node1

ssh ansadmin@<node2-private-ip>                  # connect master with node2
```

---

## OR: Manual Key Copy (if Step-2 fails, `ssh-copy-id` fails mostly in Ubuntu systems)

If you encounter **`Permission denied`** while running `ssh-copy-id`, use this method:

On the Master:
```bash
su - ansadmin
cat ~/.ssh/id_rsa.pub                            # copy the key content
```

On the Node:
```bash
su - ansadmin
mkdir -p ~/.ssh && cd ~/.ssh
vi authorized_keys                               # paste the key content copied from master
```

Back on the Master:
```bash
ssh ansadmin@<node-ip>                           # test passwordless SSH
```

## Comments & Best Practices

* **SSH Key-Based Authentication** is **more secure** and recommended.
* **Password-Based Authentication** may be used temporarily or as a fallback, but it is less secure.
* **Best Practice**: Once SSH keys are set up, **disable password authentication** in the SSH configuration file to enhance security.
