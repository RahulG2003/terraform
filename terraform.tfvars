region = "ap-south-1"

vpc_cidr_block = "10.0.0.0/16"

public_subnet_cidr_block = "10.0.1.0/24"

private_subnet_cidr_block = "10.0.2.0/24"

rds_subnet_cidr_block = "10.0.3.0/24"

ssh_cidr_blocks = ["0.0.0.0/0"]

mysql_cidr_blocks = ["0.0.0.0/0"]

instance_type = "t2.micro"

db_instance_class = "db.t2.micro"

db_allocated_storage = 20

db_username = "your_db_username"

db_password = "your_db_password"
