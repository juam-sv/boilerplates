# Data strucutres for the terraform configuration
data "aws_ami" "ubuntu" {
  most_recent = true

  # region = "us-east-1"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# How use data strucutres
# resource "aws_instance" "zawarudo" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
# }