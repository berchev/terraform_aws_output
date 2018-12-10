provider "aws" {}

resource "aws_instance" "server" {
  count                       = 2
  ami                         = "ami-0e32ec5bc225539f5"
  instance_type               = "t2.micro"
  key_name                    = "gberchev_key_pair"
  associate_public_ip_address = "true"

  tags {
    Name = "terraform_server${count.index}"
  }
}

resource "aws_security_group" "group" {
  name = "security_group"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "server_id1" {
  value = "${element(aws_instance.server.*.id, 0)}"
}

output "server_id2" {
  value = "${element(aws_instance.server.*.id, 1)}"
}

output "instance_ip1" {
  value = "${element(aws_instance.server.*.public_ip, 0)}"
}

output "instance_ip2" {
  value = "${element(aws_instance.server.*.public_ip, 1)}"
}

output "server1" {
  value = "${element(aws_instance.server.*.tags.Name, 0)}"
}

output "server2" {
  value = "${element(aws_instance.server.*.tags.Name, 1)}"
}

output "instance_1_state" {
  value = "${element(aws_instance.server.*.instance_state, 0)}"
}

output "instance_2_state" {
  value = "${element(aws_instance.server.*.instance_state, 1)}"
}


output "group_name" {
  value = "${(aws_security_group.group.0.name)}"
}
