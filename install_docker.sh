#!/bin/bash
# Script to install Docker on Linux

# Print banner
echo "======================================"
echo "Docker Installation Script"
echo "DevOps Git Project - Feature Branch"
echo "======================================"

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo privileges."
    echo "Usage: sudo ./docker_install.sh"
    exit 1
fi

# Check the OS
echo "Detecting operating system..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID
    echo "Detected: $OS $VERSION"
else
    echo "Unable to detect OS. This script supports Ubuntu, Debian, CentOS, and Fedora."
    exit 1
fi

# Update package index
echo "Updating package index..."
case $OS in
    ubuntu|debian)
        apt-get update -y
        ;;
    centos|fedora)
        yum update -y
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Install required packages
echo "Installing required packages..."
case $OS in
    ubuntu|debian)
        apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg
        ;;
    centos)
        yum install -y yum-utils device-mapper-persistent-data lvm2
        ;;
    fedora)
        dnf -y install dnf-plugins-core
        ;;
esac

# Add Docker repository
echo "Adding Docker repository..."
case $OS in
    ubuntu|debian)
        curl -fsSL https://download.docker.com/linux/$OS/gpg | apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$OS $(lsb_release -cs) stable"
        apt-get update -y
        ;;
    centos)
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        ;;
    fedora)
        dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
        ;;
esac

# Install Docker
echo "Installing Docker..."
case $OS in
    ubuntu|debian)
        apt-get install -y docker-ce docker-ce-cli containerd.io
        ;;
    centos|fedora)
        yum install -y docker-ce docker-ce-cli containerd.io
        ;;
esac

# Start and enable Docker service
echo "Starting Docker service..."
systemctl start docker
systemctl enable docker

# Verify installation
echo "Verifying Docker installation..."
docker --version
docker run hello-world

# Add current user to docker group to avoid using sudo
if [ ! -z "$SUDO_USER" ]; then
    echo "Adding user $SUDO_USER to the docker group..."
    usermod -aG docker $SUDO_USER
    echo "Please log out and log back in for changes to take effect."
fi

echo "======================================"
echo "Docker installation completed!"
echo "======================================"