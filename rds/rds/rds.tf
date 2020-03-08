variable "rds_username" {
  description = "Username for RDS instance"
  type = string
}

variable "rds_password" {
  description = "Password for RDS instance"
  type = string
}

resource "aws_db_instance" "rds" {
  name = "myDb"
  identifier = "my-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = var.rds_username
  password = var.rds_password
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}

output "rds_password" {
  value = aws_db_instance.rds.password
  sensitive = true
}

output "rds_address" {
  value = aws_db_instance.rds.address
}
