# ANSIBLE VAULT 
## Update the user password
* This playbook will update user password
* The password will be stored securely in ansible vault & will be referenced in the playbook

Create a user & reference the vault file under `vars_file`
Create a variable `mypassword` & add the variable in the ansible vault
```sh
vi user-password.yaml
```
```yaml
---
- name: user module change password
  hosts: all
  become: true
  vars_file: 
  - vault.yaml
  tasks:
  - name: change user password
    ansible.builtin.user: 
      name: alexa
      update_password: always
      password: "{{ mypassword | password_hash('sha512')}}"
...
```

Create Ansible vault
```sh
ansible-vault create vault.yaml
# Set a password for the vault file
```
```yaml
mypassword: "P@$$w0RD@12345"
```

Run the user-password playbook
```sh
ansible-playbook user-password.yaml --ask-vault-pass
# Enter the vault file password to run the playbook
```

## Commands
Create a New Encrypted Playbook
```sh
ansible-vault create playbook.yaml
```

Encrypt an existing Playbook 
```sh
ansible-vault encrypt playbook.yaml
```

View the Encrypted Playbook
```sh
ansible-vault view playbook.yaml
```

Edit the Encrypted Playbook
```sh
ansible-vault edit playbook.yaml
```

Decrypt the Playbook
```sh
ansible-vault decrypt playbook.yaml
```

Run the encrypted playbook
```sh
ansible-playbook playbook.yaml --ask-vault-pass
```
