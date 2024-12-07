# Start with the official Jenkins inbound agent base image
FROM jenkins/inbound-agent:latest

# Install Docker and Docker-in-Docker dependencies
USER root
RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    gnupg \
    lsb-release \
    ca-certificates \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Install Docker-in-Docker setup
RUN curl -fsSL https://get.docker.com | sh

# Add a user and group for Docker management
RUN usermod -aG docker jenkins

# Set up a custom environment variable
ENV DOCKER_TLS_CERTDIR=/certs

# Copy entrypoint script to start Docker daemon
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the custom script
ENTRYPOINT ["/entrypoint.sh"]
