# ansible

Setup a new laptop with ansible.
Some tools like kitty and fzf are installed for MAC only.

## Quick Start

```bash
# If you are on MAC

# 1. Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Ensure that you are using zsh (and not bash)
zsh

# 3. Ensure that you have the required PATH for the tools used by ansible
source .env

# 4. Launch the installation
make

---

# NB: If you are on Linux, do not use make, but use make all-linux instead :
# make all-linux
```

## Details

### Python installation

- run the easy-setup-python script to install :
  - python3
  - pipx
  - poetry
- then use the Makefile to execute ansible with poetry (no need to install ansible or molecule locally)

```bash
# If you are on mac
./scripts/mac-easy-setup-python.sh

# Or if you are on linux
./scripts/linux-easy-setup-python.sh

make install
```

## Develop with molecule

- ensure to have the following packages
  - python3
  - pipx
  - poetry
- then use the Makefile to execute ansible with poetry (no need to install ansible or molecule locally)

```bash
# Ensure that docker is running
docker ps

# Deploy and Delete the test containers in one command
make check

# Deploy the test containers and keep its
make converge

# Then you can connect to those container with
make login

# If you have an issue or if you want to destroy all
make reset
make destroy
```

## Develop with Docker localhost

- if you want to test a full installation without molecule you can do:

```bash
make build-localhost
make run-localhost
```
