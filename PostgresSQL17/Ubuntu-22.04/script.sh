#!/bin/bash
set -e

# Script to install PostgreSQL 17 on Ubuntu 22.04

echo "=== Updating system packages ==="
sudo apt-get update -y
sudo apt-get install -y wget gnupg lsb-release

echo "=== Adding PostgreSQL repository ==="
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

echo "=== Updating package index ==="
sudo apt-get update -y

echo "=== Installing PostgreSQL 17 ==="
sudo apt-get install -y postgresql-17 postgresql-client-17

echo "=== Enabling and starting PostgreSQL service ==="
sudo systemctl enable postgresql
sudo systemctl start postgresql

echo "=== Verifying installation ==="
psql --version

echo "=== PostgreSQL 17 installation completed successfully ==="
