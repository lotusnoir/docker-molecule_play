# Docker Image to test molecule playbooks

This docker image contains molecule / docker and all necessary package to run molecule test.

#    - docker build -t test-build-moleculeplay .
#    - docker stop test-moleculeplay && docker rm test-moleculeplay
#    - docker run -d --name=test-moleculeplay --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro test-build-moleculeplay
#    - docker exec test-moleculeplay systemctl --version
#    - docker exec test-moleculeplay goss --version
#    - docker stop test-moleculeplay && docker rm test-moleculeplay

