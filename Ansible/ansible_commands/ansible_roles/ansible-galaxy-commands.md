# Ansible Galaxy commands

Search for roles on Ansible Galaxy
```sh
ansible-galaxy search mysql
```

Install roles from Ansible Galaxy 
```sh
ansible-galaxy install geerlingguy.mysql
```

Remove installed roles
```sh
ansible-galaxy remove geerlingguy.mysql
```

Initialize a new role directory structure
```sh
ansible-galaxy init test
```
See the directory structure
```sh
cd test
tree
```
