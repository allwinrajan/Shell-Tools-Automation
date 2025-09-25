#!/bin/bash
# Jenkins Installation Script for Ubuntu 22.04

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing Java (OpenJDK 11)..."
sudo apt install -y openjdk-11-jdk

echo "Verifying Java installation..."
java -version

echo "Adding Jenkins repository key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Checking Jenkins status..."
sudo systemctl status jenkins

echo "Jenkins Installation Completed!"
echo "Access Jenkins at: http://your_server_ip:8080"
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
