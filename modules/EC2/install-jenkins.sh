#!/bin/bash

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key && \
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null && \

# Update package repositories and install necessary dependencies
sudo apt-get -y update && \
sudo apt-get -y install ca-certificates curl gnupg && \

# install java
sudo apt install -y fontconfig openjdk-17-jre && \

# install jenkins
sudo apt-get -y install jenkins && \
sudo systemctl enable jenkins.service 

