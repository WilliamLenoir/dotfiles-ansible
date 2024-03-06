# Targets that are not files
.PHONY: all help build run clean check converge destroy reset login install develop easy-setup-python poetry-install poetry-shell

##############################
# VARIABLES
##############################

# Docker variables
IMAGE_NAME=ubuntu-test
IMAGE_TAG=latest
DOCKERFILE_PATH=./molecule/scenario-docker/Dockerfile

# Default command
# you can run it with 'make' or with 'make all'
all: easy-setup-python poetry-install install
all-linux: easy-setup-python-linux poetry-install install

# The development platform
develop: easy-setup-python poetry-install build check

##############################
# HELP
##############################

help:
	@echo "Available Options:"
	# Ansible
	@echo "  all Install python and run the ansible playbook locally"
	@echo "  dev Install python, build the test docker image and run molecule"
	@echo "  install Run the ansible playbook locally"
	@echo "  easy-setup-python Install python tools"
	@echo "  poetry-instlall Install the python modules with poetry"
	@echo "  poetry-shell Run a shell in the poetry managed virtual env"
	# Docker
	@echo "  build   Build the docker image $(IMAGE_NAME):$(TAG)"
	@echo "  run     Rune the docker image $(IMAGE_NAME):$(TAG)"
	@echo "  clean   Delete the docker image $(IMAGE_NAME):$(TAG)"
	# Molecule
	@echo "  check    Deploy and delete the test containers"
	@echo "  converge Deploye and keep the test containers"
	@echo "  destroy  Delete the test cotainers"
	@echo "  reset    Reset the molecule cache"
	@echo "  login    Login in a test container"

##############################
# DOCKER
##############################

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) -f $(DOCKERFILE_PATH) .

build-localhost:
	docker build -t $(IMAGE_NAME)-localhost:$(IMAGE_TAG) -f Dockerfile .

run:
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG)

run-localhost:
	docker run --rm -it $(IMAGE_NAME)-localhost:$(IMAGE_TAG)

clean:
	docker rmi $(IMAGE_NAME):$(TAG)

##############################
# MOLECULE
##############################

check:
	poetry run molecule check -s scenario-docker

converge:
	poetry run molecule converge -s scenario-docker

destroy:
	poetry run molecule destroy -s scenario-docker

reset:
	poetry run molecule reset -s scenario-docker

login:
	poetry run molecule login -s scenario-docker

##############################
# LOCALHOST
##############################

install:
	@echo "⮕  Run the ansible playbook locally"
	poetry run ansible-playbook -i inventory/envs/localhost/inventory_localhost.yml ./playbooks/my_playbook.yml

##############################
# PHYTHON
##############################

easy-setup-python:
	@echo "⮕  Install python tools"
	./scripts/mac-easy-setup-python.sh

easy-setup-python-linux:
	@echo "⮕  Install python tools"
	./scripts/linux-easy-setup-python.sh

poetry-install:
	@echo "⮕  Install the python modules with poetry"
	poetry install --no-root

poetry-shell:
	poetry shell
