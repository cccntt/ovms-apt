#!/bin/sh
# One-time user setup: adds the OVMS APT repo. Run with sudo.
set -e
REPO_URL="https://github.com/cccntt/ovms-apt.git"   # <-- only line to change (GitHub or AWS)

mkdir -p /etc/apt/keyrings
curl -fsSL "$REPO_URL/public.gpg" | gpg --dearmor --yes -o /etc/apt/keyrings/ovms.gpg
echo "deb [signed-by=/etc/apt/keyrings/ovms.gpg] $REPO_URL/ ./" > /etc/apt/sources.list.d/ovms.list
apt-get update
echo "Done. Now run: sudo apt install ovms-fake-plugin"
