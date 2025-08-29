# TERRAFORM COMMANDS

Initialize Terraform & download provider plugins
```sh
terraform init
```
Preview the execution plan                                 
```sh
terraform plan                                  
```
Apply the infrastructure changes without prompting for confirmation
```sh
terraform apply --auto-approve                  
```
Apply changes only to the specified resource
```sh
terraform apply -target=<resource_type>.<name>  
```
Destroy all resources
```sh
terraform destroy --auto-approve                
```
Destroy only the specified resource
```sh
terraform destroy -target=<resource_type>.<name> 
```
Refresh the state before applying changes (default behavior)
```sh
terraform apply -refresh=true                   
```
List all resources in the current state file
```sh
terraform state list                            
```
Display detailed state information for a specific resource
```sh
terraform state show <resource_type>.<name>     
```
Show the values of output variables from the state
```sh
terraform output                                
```
Validate the Terraform configuration syntax and structure
```sh
terraform validate                              
```
Format Terraform code for style and readability
```sh
terraform fmt                                   
```
