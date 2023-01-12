



// We also need to reate key pair for ssh to that instance , so lets configure it through terraform
// ssh-keygen -t rsa
// and refer https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair


# creating ssh-key 
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key"
  public_key = file("${path.module}/key.pub")
}

# creating a security group 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" { # Incoming setting 
    for_each = [22,80,8080,443]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {# Outgoing Incoming setting 
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "ucp-api" {
  ami           = "ami-0e2bf1ada70fd3f33"
  instance_type = "t2.micro"
  tags = {
    Name = "first-tf-instance"
  }

  # fod ssh 
  key_name = "${aws_key_pair.my_key_pair.key_name}"
  # for network policy
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"] # it takes list
}

output "printpath" {
  value = path.module
}

output "printkeyname" {
  value = aws_key_pair.my_key_pair.key_name
}

output "security_group_name" {
  value = "${aws_security_group.allow_tls.id}"         
}

output "my_publicip" {
  value = "${aws_instance.ucp-api.public_ip}"         
}
