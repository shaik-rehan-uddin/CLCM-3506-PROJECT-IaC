output "application_server_public_ip" {
  value = module.ec2_module.application_server_public_ip
}

output "jenkins_server_public_ip" {
  value = module.ec2_module.jenkins_server_public_ip
}

