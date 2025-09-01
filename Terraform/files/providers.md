# PROVIDERS BLOCK
Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs <br> <br>
Note:
* The file is stored as `providers.tf`
* It contains the information of different cloud providers
* If using multiple AWS accounts, then use `profile` & save the credentials in aws `.config` file with [dev] [prod], etc

```
provider.tf
```

```hcl
# STEP1: DEFINE AWS VERSION
# Optional if using latest version
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.67.0"
      }
    }
}
# STEP2: DEFINE THE REGION (N. Virginia)
provider "aws" {
   region = "us-east-1"
   profile = "default"
}
```
