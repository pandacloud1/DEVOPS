# TERRAFORM WORKSPACE

Create file
```sh
main.tf
```

```hcl
resource "aws_instance" "my_ec2" {
  ami           = "ami-0a5c3558529277641"
  instance_type = lookup(var.instance_type, terraform.workspace)

  tags = {
    Name = lookup(var.name, terraform.workspace)
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.small"
    dev     = "t2.micro"
    stage   = "t2.medium"
    prod    = "m4.large"
  }
}

variable "name" {
  type = map(string)
  default = {
    default = "Default-Server"
    dev     = "Dev-Server"
    stage   = "Stage-Server"
    prod    = "PROD-SERVER"
  }
}
```

## Workspace Commands

### Create new workspaces

```sh
terraform workspace new dev
```
```sh
terraform workspace new stage
```
```sh
terraform workspace new prod
```

### List all workspaces

```sh
terraform workspace list         # shows all available workspaces
```

### Select a workspace (dev)

```sh
terraform workspace select dev  
```

Apply resources in dev workspace

```sh
terraform apply --auto-approve
```

> Note: `--target` is optional and used only when you want to apply specific resources.

Destroy resources in current workspace

```sh
terraform destroy --auto-approve
```

### Switch to another workspace (stage)

```sh
terraform workspace select stage
```

Apply resources in selected workspace

```sh
terraform apply --auto-approve
```

Destroy resources in current workspace

```sh
terraform destroy --auto-approve
```
### Switch to another workspace (prod)

```sh
terraform workspace select prod
```

Apply resources in selected workspace

```sh
terraform apply --auto-approve
```

Destroy resources in current workspace

```sh
terraform destroy --auto-approve
```
