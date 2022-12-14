# Creating RDS Instance
resource "aws_db_subnet_group" "rds-db" {
name = "main"
subnet_ids = [aws_subnet.db-pvt-sub-1.id, aws_subnet.db-pvt-sub-2.id]
tags = {
Name = "rds-db"
}
}
resource "aws_db_instance" "db-int" {
allocated_storage = 10
db_subnet_group_name = aws_db_subnet_group.rds-db.id
engine = "mysql"
engine_version = "8.0.20"
instance_class = "db.t2.micro"
multi_az = true
name = "mydb"
username = "username"
password = "password"
skip_final_snapshot = true
vpc_security_group_ids = [aws_security_group.db-sg.id]
}