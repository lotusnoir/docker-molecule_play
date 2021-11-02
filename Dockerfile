FROM python:3.8

### Install molecule
RUN /usr/local/bin/python -m pip install --upgrade pip \
    && pip install --no-cache-dir ansible molecule molecule-docker molecule-goss \
    && apt-get update -y && apt-get install -y --no-install-recommends libssl-dev python-setuptools \
    && curl -fsSL https://goss.rocks/install | GOSS_DST=/usr/local/sbin sh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

### Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add i- \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo  "$CODENAME") stable" \
    && apt-get update -y && apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent docker-ce \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD [""]
