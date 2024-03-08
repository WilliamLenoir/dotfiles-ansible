#!/bin/bash

# ensure that we have some variables in the PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

brew update

echo "Install python3 for mac user"
brew install python3
python3 --version

echo "Install pipx for mac user"
brew install pipx
pipx ensurepath

echo "Install poetry for mac user"
pipx install poetry
