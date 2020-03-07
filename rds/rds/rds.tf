variable "rds_username" {
  description = "Username for RDS instance"
}

variable "rds_password" {
  description = "Password for RDS instance"
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
  // As this is a simple learning hack, I'm not needing or wanting to pay for a snapshot
  skip_final_snapshot = true
}

output "rds_details" {
  value = aws_db_instance.rds
}
