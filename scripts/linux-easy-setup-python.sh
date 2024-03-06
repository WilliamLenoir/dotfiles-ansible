#!/bin/bash

sudo apt update -yq

echo "Install python3 for linux user"
sudo apt install -y python3
python3 --version

echo "Install pipx for linux user"
sudo apt install -y pipx
pipx ensurepath

echo "Install poetry for linux user"
pipx install poetry
