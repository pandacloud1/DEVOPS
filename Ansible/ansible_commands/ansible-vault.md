# ANSIBLE VAULT 
## Playbook to update the user password
* This playbook will update user password
* The password will be stored securely in ansible vault & will be referenced in the playbook

<img width="503" height="264" alt="image" src="https://github.com/user-attachments/assets/2c6b3287-aeee-4a1e-8be8-ee85de4794f5" />

Create a user & reference the vault file under `vars_file` <br>
Create a variable `mypassword` & add the variable in the ansible vault
```sh
vi playbook.yaml
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
ansible-playbook playbook.yaml --ask-vault-pass
# Enter the vault file password to run the playbook
```

## Ansible Vault Commands
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
