resource "aws_db_instance" "main-rds-instance" {
  identifier             = "my-rds-instance"
  engine                 = "mysql"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  storage_type           = "gp2"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.main-rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main-db-subnetgroup.name
  skip_final_snapshot    = true
}
