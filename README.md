# docker-disque
[![Docker Repository on Quay.io](https://quay.io/repository/skidder/disque/status "Docker Repository on Quay.io")](https://quay.io/repository/skidder/disque)

Docker image for the Disque job messaging server.  Currently using the `1.0-rc1` release from January 2, 2016.

## Installation
Pull the container:
```shell
docker pull quay.io/skidder/disque:latest
```

## Running
Simply run the container, like:
```shell
docker run quay.io/skidder/disque:latest
```
The Disque server will listen on the default port of 7711.
