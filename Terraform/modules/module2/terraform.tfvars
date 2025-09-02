source       = "./modules/vpc"
cidr_block   = "10.0.0.0/16"
subnet_cidr  = "10.0.1.0/24"
az           = "us-east-1a"
vpc_name     = "my_vpc"

ami            = "ami-00ca32bbc84273381"
instance_type  = "t2.micro"
subnet_id      = module.vpc.subnet_id
key_name       = "my-key"
instance_name  = "my_instance"

source      = "./modules/s3"
bucket_name = "demo-panda-bucket-02092025"
