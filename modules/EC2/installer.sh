#!/bin/bash

# Update package repositories and install necessary dependencies
sudo apt-get update -y && \
sudo apt-get -y install ca-certificates curl gnupg && \

# Add Docker GPG key and repository
sudo install -m 0755 -d /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
sudo chmod a+r /etc/apt/keyrings/docker.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \

# Install Docker
sudo apt-get update -y && \
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \

# Change ownership of docker socket and enable Docker services
sudo chown ubuntu /var/run/docker.sock && \
sudo systemctl enable docker.service && \
sudo systemctl enable containerd.service && \

# Install nginx 
sudo apt-get -y install nginx && \
sudo systemctl enable nginx.service 