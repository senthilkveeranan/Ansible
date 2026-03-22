provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "nginx_server" {
  ami           = "ami-0f559c3642608c138 
  instance_type = "t2.micro"
  key_name      = "todayaws"

  tags = {
    Name = "Ansible-Nginx-Server"
  }
}

output "public_ip" {
  value = aws_instance.nginx_server.public_ip
}
