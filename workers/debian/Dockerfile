FROM debian:latest

RUN apt-get update &&           \
    apt-get dist-upgrade -y &&  \
    apt-get install openjdk-8-jre-headless -y

RUN useradd -m -s /bin/bash jenkins
USER jenkins
CMD ["java", "-version"]
