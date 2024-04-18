output "application_server_public_ip" {
  value = aws_instance.main.public_ip
}

output "jenkins_server_public_ip" {
  value = aws_instance.jenkins.public_ip
}
