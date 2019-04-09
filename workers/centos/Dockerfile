FROM centos:latest

RUN yum update -y &&    \
    yum install java-1.8.0-openjdk-headless -y

RUN useradd -m -s /bin/bash jenkins
USER jenkins
CMD ["java", "-version"]
