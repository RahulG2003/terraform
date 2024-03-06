terraform {
  backend "s3" {
    bucket = "terraformconfigur"
    key    = "terraformconfigurstate"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  description = "The AWS region in which to create the resources"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "rds_subnet_cidr_block" {
  description = "CIDR block for the RDS subnet"
  default     = "10.0.3.0/24"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "mysql_cidr_blocks" {
  description = "CIDR blocks allowed for MySQL access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  default     = "db.t2.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance (in GB)"
  default     = 20
}

variable "db_username" {
  description = "Username for the RDS instance"
  default     = "rahul"
}

variable "db_password" {
  description = "Password for the RDS instance"
  default     = "rahul9943"
}
