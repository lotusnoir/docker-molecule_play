FROM python:3.9

### Install docker
RUN apt-get update -y && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update -y && apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

### Install molecule
RUN /usr/local/bin/python -m pip install --upgrade pip \
    && pip install --no-cache-dir ansible molecule molecule-docker molecule-goss jmespath\
    && apt-get update -y \
    && apt-get install -y --no-install-recommends libssl-dev python3-setuptools python3-netaddr \
    && wget -q -O /usr/local/bin/goss https://github.com/aelsabbahy/goss/releases/download/v0.3.21/goss-linux-amd64 && chmod +x /usr/local/bin/goss \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD [""]
