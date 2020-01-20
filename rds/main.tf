resource "aws_db_instance" "myRds" {
  name = "myDb"
  identifier = "my-first-terraform-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "$REDACTED"
  password = "$REDACTED"
  port = 3306
  allocated_storage = 20
  // As this is a simple learning hack, I'm not needing or wanting to pay for a snapshot
  skip_final_snapshot = true
}
