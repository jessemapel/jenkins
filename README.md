# Jenkins with Docker

Master branch is the Jenkins LTS docker image with Docker installed

Jenkins build agent ('worker') docker images are also included

Each branch represents a different tag for the Jenkins build agent docker images
located at [usgsastro/jenkins-worker](https://cloud.docker.com/u/usgsastro/repository/docker/usgsastro/jenkins-worker)

### Base image branches
lastest docker images for each os with java and the [jenkins jnlp slave](https://github.com/jenkinsci/docker-jnlp-slave) software installed
- centos
- debian
- fedora
- ubuntu

### [ISIS3](https://github.com/USGS-Astrogeology/ISIS3) image branches
extensions of the base docker images with dependencies for building ISIS3
- centos-isisdeps
- debian-isisdeps
- fedora-isisdeps
- ubuntu-isisdeps

