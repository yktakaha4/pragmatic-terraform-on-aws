variable "example_instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = var.example_instance_type

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF

  tags = {
    Name = "example"
  }
}
