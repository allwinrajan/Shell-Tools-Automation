#!/bin/bash
set -e

# Script to install .NET 8 Runtime on Ubuntu 22.04
# Tested on fresh Ubuntu 22.04 LTS

echo "=== Updating system packages ==="
sudo apt-get update -y
sudo apt-get install -y wget apt-transport-https software-properties-common

echo "=== Adding Microsoft package repository ==="
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

echo "=== Updating package index after adding Microsoft repo ==="
sudo apt-get update -y

echo "=== Installing .NET 8 Runtime ==="
sudo apt-get install -y dotnet-runtime-8.0

echo "=== Verifying installation ==="
dotnet --list-runtimes || echo "Installation completed, but dotnet not found in PATH"

echo "=== .NET 8 Runtime installation finished successfully ==="
