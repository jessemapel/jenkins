FROM debian:latest

ENV VERSION 3.9

RUN apt-get update &&                               \
    apt-get dist-upgrade -y &&                      \
    apt-get install openjdk-8-jre-headless -y &&    \
    apt-get clean &&                                \
    rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave  \
    /usr/local/bin/jenkins-slave

ADD https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar    \
    /usr/share/jenkins/slave.jar

RUN useradd -m -s /bin/bash jenkins
RUN chown -R jenkins:jenkins /usr/share/jenkins
RUN chown jenkins:jenkins /usr/local/bin/jenkins-slave && chmod +x /usr/local/bin/jenkins-slave

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
