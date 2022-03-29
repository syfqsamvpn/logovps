#!/bin/bash
systemctl stop wg-quick@wg0
apt install sudo lsb-release -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
sudo apt update -y
sudo apt -y --no-install-recommends install net-tools iproute2 openresolv dnsutils linux-headers-$(uname -r)
sudo apt --no-install-recommends install wireguard-tools wireguard-dkms
systemctl start wg-quick@wg0
reboot