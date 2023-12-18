FROM docker:stable-dind

RUN apk add --no-cache python3 python3-dev build-base py3-pip gcc git bash curl build-base  autoconf automake py3-cryptography linux-headers musl-dev libffi-dev openssl-dev openssh
RUN pip install --upgrade pip

# Get Rust; NOTE: using sh for better compatibility with other base images
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

RUN python3 -m pip install ansible molecule-plugins[docker]




#  - ansible --version
#  - molecule --version
### repos
#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
#    && echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
#     bookworm stable" | tee /etc/apt/sources.list.d/docker.list
#
#### apt requirements
#RUN apt-get update -y \
#    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent lsb-release docker-ce docker-ce-cli containerd.io libssl-dev python3-setuptools python3-netaddr \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*
#
#### pip and curl pkgs
#RUN /usr/local/bin/python -m pip install --no-cache --upgrade pip \
#    && pip3 install --no-cache --disable-pip-version-check ansible ansible-lint molecule molecule-docker jmespath flake8 yamllint \
#    && wget -q -O /usr/local/bin/goss https://github.com/aelsabbahy/goss/releases/download/v0.3.21/goss-linux-amd64 && chmod +x /usr/local/bin/goss 
#
##RUN pip3 install --no-cache-dir molecule-goss
##RUN addgroup -S docker
##RUN adduser -S docker -H -G docker 
##USER docker
#
#CMD ["bash"]
