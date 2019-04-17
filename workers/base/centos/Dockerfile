FROM centos:latest

ENV TINI_VERSION v0.18.0

RUN yum update -y &&    \
    yum install java-1.8.0-openjdk-headless -y

ADD https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave  \
    /usr/local/bin/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN useradd -m -s /bin/bash jenkins
USER jenkins

ENTRYPOINT ["/tini", "--", "/usr/local/bin/jenkins-slave"]
