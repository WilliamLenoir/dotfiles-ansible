#!/bin/bash

brew update

echo "Install python3 for mac user"
brew install python3
python3 --version

echo "Install pipx for mac user"
brew install pipx
pipx ensurepath

echo "Install poetry for mac user"
pipx install poetry
