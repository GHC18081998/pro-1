# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "web-1" {
ami = "ami-0f924dc71d44d23e2"
instance_type = "t2.micro"
count = 1
key_name = "terraform-1"
vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
subnet_id = "${aws_subnet.web-pub-sub-1.id}"
associate_public_ip_address = true
user_data = "${file("data.sh")}"
tags = {
Name = "web-1"
}
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "web-2" {
ami = "ami-0f924dc71d44d23e2"
instance_type = "t2.micro"
count = 1
key_name = "terraform-1"
vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
subnet_id = "${aws_subnet.web-pub-sub-2.id}"
associate_public_ip_address = true
user_data = "${file("data.sh")}"
tags = {
Name = "web-2"
}
}

# Creating 3nd EC2 instance in Private Subnet
resource "aws_instance" "db" {
ami = "ami-0f924dc71d44d23e2"
instance_type = "t2.micro"
count = 1
key_name = "terraform-1"
vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
subnet_id = "${aws_subnet.db-pvt-sub-1.id}"

tags = {
Name = "db"
}
}