resource "aws_ec2_instance" "main-aws" {
  ami             = "ami-0e670eb768a5fc3d4"
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.main-subnet.id
  security_groups = [aws_security_group.main-ec2-sg.id]
}