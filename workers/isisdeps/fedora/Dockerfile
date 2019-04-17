FROM usgsastro/jenkins-worker:fedora

SHELL ["/bin/bash", "-c"]
ENV CONDA_HOME /home/jenkins/.conda
ENV PATH $CONDA_HOME/bin:$PATH

USER root

RUN dnf update -y &&                \
    dnf install -y                  \
        bzip2                       \
        ca-certificates             \
        curl                        \
        git                         \
        wget &&                     \
    dnf clean all

USER jenkins
WORKDIR /home/jenkins

# Install conda
RUN wget -qO miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh &&      \
    chmod +x miniconda.sh &&                                                                            \
    ./miniconda.sh -b -p $CONDA_HOME &&                                                                 \
    $CONDA_HOME/bin/conda clean -tipsy &&                                                               \
    echo ". \$CONDA_HOME/etc/profile.d/conda.sh" >> ~/.bashrc &&                                        \
    echo "conda activate base" >> ~/.bashrc &&                                                          \
    rm miniconda.sh

