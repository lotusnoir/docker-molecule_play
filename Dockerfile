FROM python:slim-bookworm
LABEL maintainer="lotusnoir"

ENV container=docker
ENV PIP_ROOT_USER_ACTION=ignore
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US:en      

### repos
RUN apt-get update -y && apt-get install -y --no-install-recommends curl gpg && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
     bookworm stable" | tee /etc/apt/sources.list.d/docker.list

### apt requirements
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent lsb-release docker-ce docker-ce-cli containerd.io libssl-dev python3-setuptools python3-netaddr wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

### pip and curl pkgs
RUN /usr/local/bin/python -m pip install --no-cache --upgrade pip \
    && pip3 install --no-cache --disable-pip-version-check ansible ansible-lint molecule molecule-docker jmespath flake8 yamllint \
    && wget -q -O /usr/local/bin/goss https://github.com/aelsabbahy/goss/releases/download/v0.4.8/goss-linux-amd64 && chmod +x /usr/local/bin/goss 
