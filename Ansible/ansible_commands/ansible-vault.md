# ANSIBLE VAULT COMMANDS

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
