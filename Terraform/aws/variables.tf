variable "image" {
  default     = "ami-08d4ac5b634553e16"
  type        = string
  description = "Ubuntu Server 20.04 LTS (HVM), SSD Volume Type"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "The type of instance to start."
}

variable "password" {
  default     = "password"
  type        = string
  description = "The password for the default user."
}