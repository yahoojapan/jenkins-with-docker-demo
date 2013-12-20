FROM ubuntu:12.04
MAINTAINER Kazuki Suda <kazuki.suda@gmail.com>

RUN apt-get -q update; apt-get -y upgrade
RUN apt-get -y install build-essential sudo curl wget git-core

# Install NVM
RUN git clone --depth 1 https://github.com/creationix/nvm.git ~/.nvm

# Install node
RUN bash -c ". /.nvm/nvm.sh; nvm install 0.8"
RUN bash -c ". /.nvm/nvm.sh; nvm install 0.10"
RUN bash -c ". /.nvm/nvm.sh; nvm install 0.11"

# Create user
RUN useradd -u 45678 -s /bin/bash -m worker

# Make workspace
RUN mkdir /workspace

ENTRYPOINT ["/bin/bash", "-c"]
