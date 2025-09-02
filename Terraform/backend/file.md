## 🚀 CONFIGURE S3 & DYNAMODB AS REMOTE BACKEND

> 📌 **Why?**  
Storing the Terraform state file locally is not recommended for team environments or production use. Instead, we use:
- **Amazon S3** to store the state file remotely
- **DynamoDB** to enable state locking and prevent concurrent modifications

## STEP 1: Create `S3` Bucket & `DynamoDB` Table

### `backend.tf` (resource definitions)

#### Create S3 Bucket

```hcl
resource "aws_s3_bucket" "my_s3" {
  bucket        = "nasir-bucket-03012024"  # Must be globally unique
  force_destroy = true                     # Allows bucket deletion even if non-empty
}
```

#### Create DynamoDB Table

```hcl
resource "aws_dynamodb_table" "my_table" {
  name         = "state-file-locking"
  billing_mode = "PAY_PER_REQUEST"         # On-demand mode (no need to set capacity)
  hash_key     = "LockID"                  # Required primary key

  attribute {
    name = "LockID"
    type = "S"                             # S = String
  }
}
```

---

## STEP 2: Apply the Resources

```bash
terraform init
terraform apply --auto-approve
```

---

## STEP 3: Configure Remote Backend in Your Terraform Code

> Add this block to your root `main.tf` or a dedicated `backend.tf` file:

```hcl
terraform {
  backend "s3" {
    bucket         = "nasir-bucket-03012024"              # Must match your created bucket
    key            = "state-file/terraform.tfstate"       # Path inside the bucket
    region         = "us-east-1"
    dynamodb_table = "state-file-locking"                 # Enables state locking
    encrypt        = true                                 # Encrypt state at rest
  }
}
```

> ⚠️ Note: You cannot apply this backend block using `terraform apply`. You must run `terraform init` to initialize or migrate the backend.

## STEP 4: Reinitialize Terraform

```bash
terraform init
```
> Terraform will prompt you to migrate your local state to the configured S3 backend.


## STEP 5: Apply or Destroy Resources

```bash
terraform apply --auto-approve
```
```bash
terraform destroy --auto-approve
```

## Note:

- Once the backend is configured, your state file will be stored in S3 and locked via DynamoDB.
- You can safely delete the local `.tfstate` file after migration.
- If the state file gets locked (e.g., due to an interrupted apply), unlock it using:
  ```bash
  terraform force-unlock <LOCK_ID>
  ```
