resource "aws_db_subnet_group" "main-db-subnetgroup" {
  subnet_ids = [
    aws_subnet.main-privatesubnet-rds.id,
    aws_subnet.main-privatesubnet-ec2.id
  ]
}
