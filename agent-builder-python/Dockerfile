# Dockerfile for Python agent
FROM jenkins/inbound-agent:latest

# Install Python
USER root
RUN apt-get update

RUN apt-get install -y make python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jenkins user
USER jenkins
