# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# -----------------
# AWS Resources
# -----------------

# Create a new key pair for SSH access
resource "aws_key_pair" "web_server_key" {
  key_name   = "web-server-key"
  public_key = file(var.public_key_path)
}

# Create a security group to allow SSH and HTTP traffic
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allow inbound traffic for web server"

  # Allow inbound SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a simple EC2 instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.web_server_key.key_name
  tags = {
    Name = "Web Server"
  }
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  # Install a simple web server (Nginx) on launch
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Hello from Terraform!</h1>" | sudo tee /var/www/html/index.html
              EOF
}

# -----------------
# Outputs
# -----------------

# Output the public IP of the EC2 instance
output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}
