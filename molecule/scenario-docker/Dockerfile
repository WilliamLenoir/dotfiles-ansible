FROM ubuntu:22.04

# - Prevent interactive prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# - Update package list and install common utilities
#
# - Remove the apt package lists to reduce image size and ensure that future installations
#   are forced to fetch the most current list of packages, avoiding issues with outdated
#   package information.
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    software-properties-common \
    build-essential \
    cmake \
    gettext libgettextpo-dev \
    vim \
    git \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# - Create a test-user that will be used by molecule

RUN addgroup --gid 1000 test-user
RUN adduser --gecos test-user --uid 1000 --gid 1000 --disabled-password test-user

# Allow to use sudo without password
RUN echo 'test-user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER test-user

# - Set the working directory
WORKDIR /home/test-user

# - Default command to execute when the container starts
CMD ["bash"]
