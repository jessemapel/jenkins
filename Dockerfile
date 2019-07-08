FROM centos:latest

ENV VERSION 3.9

RUN yum update -y &&                                \
    yum install java-1.8.0-openjdk-headless -y &&   \
    yum clean all

ADD https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/master/jenkins-slave  \
    /usr/local/bin/jenkins-slave

ADD https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar    \
    /usr/share/jenkins/slave.jar

RUN useradd -m -s /bin/bash jenkins
RUN chown -R jenkins:jenkins /usr/share/jenkins
RUN chown jenkins:jenkins /usr/local/bin/jenkins-slave && chmod +x /usr/local/bin/jenkins-slave

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
