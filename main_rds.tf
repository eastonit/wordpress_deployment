resource "aws_db_instance" "wp_database" {
  allocated_storage    = 10
  db_name              = "wp_database"
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t3.micro"
  username             = "dbusername"
  password             = "dbpassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
