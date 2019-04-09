FROM ubuntu:latest

RUN apt-get update &&           \
    apt-get dist-upgrade -y &&  \
    apt-get install openjdk-8-jre-headless -y

RUN wget -O /usr/local/bin/jenkins-slave https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave

RUN useradd -m -s /bin/bash jenkins
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
