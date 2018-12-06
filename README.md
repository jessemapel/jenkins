# jenkins-master

Master image has customizable uid & gid for the 'jenkins' user for easier bind mounts

```
version: "3.7"

services:
  master:
    image: usgsastro/jenkins-master
    environment:
      JENKINS_UID: 1555
      JENKINS_GID: 1555
    ports:
      - 8080:8080
```
