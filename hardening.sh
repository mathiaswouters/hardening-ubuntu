#!/bin/bash

# Update packages
sudo apt-get update
sudo apt-get upgrade

# Install dependencies
sudo apt-get install git net-tools procps --no-install-recommends -y

# Install AIDE
sudo apt-get install aide -y

# Remove rsync
sudo apt-get remove rsync -y

# Set permissions for audit log
sudo chown root:root /var/log/audit/audit.log
sudo chmod 640 /var/log/audit/audit.log
sudo chmod 0750 /var/log/audit/audit.log

# Install iptables-persistent
sudo apt-get install iptables-persistent -y

# Remove iptables-persistent
sudo apt-get remove iptables-persistent -y

# Add content to /etc/motd
echo "DO NOT ACCESS WITHOUT PERMISSION!" | sudo tee /etc/motd


# Other Script
git clone https://github.com/mathiaswouters/hardening.git
cd ./hardening
sudo bash ubuntu.sh

