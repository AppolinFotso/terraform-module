
resource "random_password" "random" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "rds" {
  
  allocated_storage    = 10
  db_name              = "myhotel"
  engine               = "postgres"
  engine_version       = "15.5"
  instance_class       = "db.t3.micro"
  username             = "appolin"
  password             = random_password.random.result
  iam_database_authentication_enabled = true
  port                 = "5432"
  parameter_group_name = "default.postgres15"
  db_subnet_group_name = "rds-ec2-db-subnet-group-1"
  vpc_security_group_ids = ["sg-01d2ae1865f00e3f9"]
  skip_final_snapshot  = true
  deletion_protection = true

}

