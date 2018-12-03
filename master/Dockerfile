FROM jenkins/jenkins:lts

ENV JENKINS_UID 1000
ENV JENKINS_GID 1000
ENV DOCKER_GID 989
ENV DOCKER_HOST unix:///var/run/docker.sock

USER root
COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

# Updates
RUN echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y && apt-get autoremove -y

# Docker, for passthrough unix socket to control swarm
RUN apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update -y
RUN apt-get install docker-ce -y
VOLUME /var/run/docker.sock:/var/run/docker.sock
RUN usermod -aG docker jenkins

# The default jenkins image has no repos configured, so get rid of all
# the repos we added above for updates
RUN echo '' > /etc/apt/sources.list
RUN apt-get autoclean -y
RUN rm -rf /var/cache/apt/archives/*

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
CMD ["tail", "-f", "/var/log/jenkins.log"]
