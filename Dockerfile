FROM python:3.8

RUN /usr/local/bin/python -m pip install --upgrade pip \
    && pip install --no-cache-dir molecule molecule-docker molecule-goss \
    && apt-get update -y && apt-get install -y --no-install-recommends libssl-dev python-setuptools \
    && curl -fsSL https://goss.rocks/install | GOSS_DST=/usr/local/sbin sh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD [""]
