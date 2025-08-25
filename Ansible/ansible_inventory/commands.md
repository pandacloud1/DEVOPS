# Adding Nodes in Ansible Inventory (hosts file)

## Step 1: Add Node IPs in the Inventory (hosts file)
Edit the Ansible hosts file:

```bash
sudo vi /etc/ansible/hosts
````

Add the server groups and their corresponding private IPs

```ini
[webserver]
<Node1-PrivateIP>

[database]
<Node2-PrivateIP>
```

---

## Step 2: Configure the Ansible Configuration File

Edit the Ansible configuration file:

```bash
sudo vi /etc/ansible/ansible.cfg
```

Add or update the following settings:

```ini
inventory = /etc/ansible/hosts
sudo_user = root

# Optional: To avoid warnings
interpreter_python = auto_silent
command_warnings = False
```

---

## Step 3: Test Connection with Nodes

Run an ad-hoc command to check if the nodes are responding:

```bash
ansible -m ping all
```
