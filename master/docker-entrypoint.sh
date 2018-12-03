#!/bin/bash

usermod -u $JENKINS_UID jenkins
groupmod -g $JENKINS_GID jenkins
groupmod -g $DOCKER_GID docker

if [ -f /var/run/docker.sock ]; then
    chown root:docker /var/run/docker.sock
    chmod 644 /var/run/docker.sock
fi

chown -R jenkins:jenkins $JENKINS_HOME /usr/share/jenkins/ref

runuser -m jenkins -c "/usr/local/bin/jenkins.sh" > /var/log/jenkins.log &
dockerd &

exec "$@"
