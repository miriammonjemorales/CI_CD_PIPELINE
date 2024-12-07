#!/bin/bash

# Start the Docker daemon in the background
dockerd --host=unix:///var/run/docker.sock &

# Wait for Docker daemon to start
until docker info > /dev/null 2>&1; do
    echo "Waiting for Docker daemon to start..."
    sleep 2
done
echo "Docker daemon started."

# Start the Jenkins agent after the Docker daemon is running
if [ -z "$JENKINS_SECRET" ] || [ -z "$JENKINS_AGENT_NAME" ]; then
    echo "Error: JENKINS_SECRET and JENKINS_AGENT_NAME must be provided."
    exit 1
fi

#    -url ${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/jenkins-agent.jnlp \
exec java -jar /usr/share/jenkins/agent.jar \
    -url ${JENKINS_URL} \
    -name ${JENKINS_AGENT_NAME} \
    -secret ${JENKINS_SECRET} \
    -workDir ${JENKINS_AGENT_WORKDIR}
