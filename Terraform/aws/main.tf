terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

terraform {
  backend "s3" {
    bucket = "terraform-lab-madra"
    key    = "terraform-test.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-1"
  # alias  = "apelido-name"
}

resource "aws_instance" "zawarudo" {
  ami           = var.image
  instance_type = var.instance_type
  subnet_id     = aws_subnet.freeword_snet.id
  # provider = aws.apelido-name

  tags = {
    Name = "THE_WORLD"
  }
}

# VPC SECTION

resource "aws_vpc" "vpc_dreams" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "freeword_snet" {
  vpc_id     = aws_vpc.vpc_dreams.id
  cidr_block = "10.0.1.0/24"
  # availability_zone = "us-east-1"
}

resource "aws_subnet" "prision_snet" {
  vpc_id     = aws_vpc.vpc_dreams.id
  cidr_block = "10.0.2.0/24"
}

# RDS SECTION
/**
resouce "aws_db_instance" "db" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "mydb"
  username = "admin"
  password = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  publicly_accessible = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_sng.name
}
**/