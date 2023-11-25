FROM docker:24.0.7-dind

ENV DEFAULT_LOCAL_TMP="/tmp"

#RUN apk update && apk upgrade

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

ENV ansible_version=2.15.6
ENV ansible_major_version=2.15
ENV ansible_commv=8.6.1
ENV molecule_version=6.0.2
ENV umask=022
ENV PIP_BREAK_SYSTEM_PACKAGES=1


RUN pip3 install --disable-pip-version-check --break-system-packages ansible==${ansible_commv} ansible-core==${ansible_version} molecule==${molecule_version} molecule-docker ansible-lint flake8 yamllint

RUN addgroup -S docker
RUN adduser -S docker -H -G docker 
USER docker
CMD ["bash"]
