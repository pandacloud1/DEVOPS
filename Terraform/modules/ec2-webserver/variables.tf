# Variable block for the default variables
variable "ami" {
    default = "ami-04aa00acb1165b32a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
    default = "Linux_key"
}

variable "user" {
    default = "ec2-user"
}

variable "tags" {
    default = "Webserver"
}
