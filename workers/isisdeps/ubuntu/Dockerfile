FROM usgsastro/jenkins-worker:ubuntu

USER root

COPY packages.txt /tmp/
RUN bash -c 'apt-get update && apt-get install $(sed -E -e "s/#.*$//g" -e "/^$/d" /tmp/packages.txt | tr "\n" " ") -y'
