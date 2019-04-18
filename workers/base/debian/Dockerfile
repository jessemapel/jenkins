FROM debian:latest

RUN apt-get update &&                               \
    apt-get dist-upgrade -y &&                      \
    apt-get install openjdk-8-jre-headless -y &&    \
    apt-get clean &&                                \
    rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave  \
    /usr/local/bin/jenkins-slave

RUN useradd -m -s /bin/bash jenkins
RUN chown jenkins:jenkins /usr/local/bin/jenkins-slave && chmod +x /usr/local/bin/jenkins-slave

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
