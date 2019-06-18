locals {
  example_instance_type = "t3.micro"
}

resource "aws_instance" "example" {
  ami                    = "ami-0f9ae750e8274075b"
  instance_type          = local.example_instance_type
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  user_data = file("./user_data.sh")

  tags = {
    Name = "example"
  }
}

resource "aws_security_group" "example_ec2" {
  name = "example-ec2"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "example_public_dns" {
  value = aws_instance.example.public_dns
}

output "example_instance_id" {
  value = aws_instance.example.id
}
