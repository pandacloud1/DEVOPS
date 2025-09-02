# Variable block for the default variables
variable "ami" {
    default = "ami-00ca32bbc84273381"
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
