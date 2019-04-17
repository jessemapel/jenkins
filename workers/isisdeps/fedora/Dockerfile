FROM usgsastro/jenkins-worker:fedora

ENV CONDA_HOME /home/jenkins/conda

USER root

COPY packages.txt .
RUN bash -c 'dnf install $(sed -E -e "s/#.*$//g" -e "/^$/d" /tmp/packages.txt | tr "\n" " ") -y'

USER jenkins

# Install conda
RUN curl -s -o miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh &&    \
    bash miniconda.sh -b -p $CONDA_HOME &&                                                             \
    echo '. $CONDA_HOME/etc/profile.d/conda.sh' >> ~/.bashrc &&                                             \
    source ~/.bashrc &&                                                                                     \
    conda update conda -y

# Clean up
RUN bash -c 'packages.txt miniconda.sh'
