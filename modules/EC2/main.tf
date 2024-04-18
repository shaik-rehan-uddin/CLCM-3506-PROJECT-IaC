# Create EC2 instance
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_id

  depends_on             = [aws_security_group.instance_security_group]
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
  user_data              = file("${path.module}/installer.sh")

  tags = {
    Name = var.instance_name
  }
}

# Create a security group
resource "aws_security_group" "instance_security_group" {
  vpc_id = var.vpc_id

  # Example rule allowing inbound SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Example rule allowing inbound HTTP traffic
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

  tags = {
    Name = "application_server_security_group"
  }
}



# Create EC2 instance for Jenkins server
resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_id

  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]
  user_data              = file("${path.module}/install-jenkins.sh")

  tags = {
    Name = "Jenkins Server"
  }
}

# Create a security group for Jenkins server
resource "aws_security_group" "jenkins_security_group" {
  vpc_id = var.vpc_id

  # Allow inbound SSH traffic for administration
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTP traffic for Jenkins web interface
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTPS traffic for secure Jenkins web interface
  ingress {
    from_port   = 443
    to_port     = 443
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

  tags = {
    Name = "jenkins_security_group"
  }
}
