# Docker Image to test molecule playbooks

This docker image contains molecule / docker + all packages to run molecule test.
We still install goss for tests, but we will prefer ansible from now on.

## Build image

    docker build -t test-build-moleculeplay .
