FROM fedora:latest

RUN dnf update -y &&                                \
    dnf install java-1.8.0-openjdk-headless -y &&   \
    dnf clean all

ADD https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave  \
    /usr/local/bin/jenkins-slave

RUN useradd -m -s /bin/bash jenkins
RUN chown jenkins:jenkins /usr/local/bin/jenkins-slave && chmod +x /usr/local/bin/jenkins-slave

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
