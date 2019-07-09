FROM jenkins/jenkins:lts

ENV DOCKER_HOST unix:///var/run/docker.sock

USER root

# Updates
RUN echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y && apt-get autoremove -y

# Docker, for passthrough unix socket to control swarm
RUN apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update -y
RUN apt-get install docker-ce -y
RUN usermod -aG docker jenkins

# The default jenkins image has no repos configured, so get rid of all
# the repos we added above for updates
RUN echo '' > /etc/apt/sources.list
RUN apt-get autoclean -y
RUN rm -rf /var/cache/apt/archives/*

# Allow a bunch of scripts to be executed at runtime
ADD docker-entrypoint.sh /usr/local/bin
RUN mkdir /docker-entrypoint.d && chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]

