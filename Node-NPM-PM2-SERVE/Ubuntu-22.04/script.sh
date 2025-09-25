#!/bin/bash
set -e

# Script to install latest Node.js, npm, PM2, and serve static files

echo "=== Updating system packages ==="
sudo apt-get update -y
sudo apt-get install -y curl build-essential

echo "=== Installing Node.js (latest LTS) ==="
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "=== Verifying Node.js and npm installation ==="
node -v
npm -v

echo "=== Installing PM2 globally ==="
sudo npm install -g pm2

echo "=== Installing serve globally ==="
sudo npm install -g serve

echo "=== Setting PM2 to start on boot ==="
pm2 startup systemd -u $USER --hp $HOME

echo "=== Installation complete ==="
echo "You can now serve a static build folder with PM2 using:"
echo "pm2 serve /path/to/your/build 3000 --name my-app"

