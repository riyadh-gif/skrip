#!/bin/bash

# 1. Set timezone ke Asia/Jakarta
echo "Setting timezone to Asia/Jakarta..."
timedatectl set-timezone Asia/Jakarta

# 2. Update & upgrade system
echo "Updating and upgrading packages..."
apt-get update -y && apt-get upgrade -y

# 3. Install Git, Curl, Zip, Python3, Python3-pip
echo "Installing Git, Curl, Zip, Python3, and Python3-pip..."
apt-get install -y git curl zip python3 python3-pip

# 4. Install Docker
echo "Installing Docker..."
# Prasyarat
apt-get install -y ca-certificates gnupg lsb-release

# Tambah Docker official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

# Tambah Docker repo
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "All setup done!"
