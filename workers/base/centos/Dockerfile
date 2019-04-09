FROM centos:latest

RUN yum update -y &&    \
    yum install java-1.8.0-openjdk-headless -y

RUN curl -fsSL -o /usr/local/bin/jenkins-slave https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave

RUN useradd -m -s /bin/bash jenkins
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
