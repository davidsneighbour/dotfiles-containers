#!/bin/bash

check_sudo() {
  if [[ "${EUID}" -ne 0 ]]; then
    echo "Error: This script must be run as root (use sudo)." >&2
    exit 1
  fi
}

check_sudo
systemctl stop ollama
systemctl disable ollama
rm /etc/systemd/system/ollama.service
rm $(which ollama)
rm -r /usr/share/ollama
userdel ollama
groupdel ollama
rm -rf /usr/local/lib/ollama
