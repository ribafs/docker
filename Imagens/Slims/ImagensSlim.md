# Imagen pequenas

# ideally, we'd use official static binary releases from http://landley.net/toybox/downloads/binaries/ but they don't include the (pending) "sh" implementation so they're not quite enough for a full system yet

FROM alpine:3.12 AS mini

RUN set -eux; \
	apk add --no-cache \
		bash \
		gcc \
		linux-headers \
		make \
		musl-dev \
	;

WORKDIR /toybox

# https://landley.net/toybox/downloads/?C=M;O=D
# https://github.com/landley/toybox/releases

ENV TOYBOX_VERSION 0.8.4

RUN set -eux; \
	wget -O toybox.tgz "https://landley.net/toybox/downloads/toybox-$TOYBOX_VERSION.tar.gz"; \
	tar -xf toybox.tgz --strip-components=1; \
	rm toybox.tgz

RUN make root BUILTIN=1
# (we set "BUILTIN=1" to avoid cpio / initramfs creation because we aren't building / don't need a kernel)

FROM scratch
COPY --from=build /toybox/root/host/fs/ /
CMD ["sh"]


## debian

debian:unstable-slim - 27.23MB

debian:stable-slim - 25.84MB

Dockerfile

FROM debian:stable-slim as deb

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install sqlite3=3.* && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	mkdir -p /root/db

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

CMD ["bash"]

docker build -t deb

docker images - 95.1MB

docker run -dt --name deb-cont deb

docker exec -it deb-cont bash

cat /etc/os-release

Obs.: muito confortável, pois conheço os comandos.

## alpine

# bitnami/minideb - 25.46MB

Dockerfile

FROM bitnami/minideb as mini-img

RUN install_packages apache2


docker build -t mini-img .

docker images - 169MB

docker run -dt --name mini-cont mini-img

docker exec -it mini-cont sh

cat /etc/os-release - Debian 10

docker run --rm -it bitnami/minideb:latest

docker run --rm -it bitnami/minideb:stretch

hese images also include an install_packages command that you can use instead of apt. This takes care of some things for you:

    Install the named packages, skipping prompts etc.
    Clean up the apt metadata afterwards to keep the image small.
    Retrying if apt fails. Sometimes a package will fail to download due to a network issue, and this may fix that, which is particularly useful in an automated build pipeline.

    $ install_packages apache2 memcached


## debian:stable-slim - 25.84MB

FROM debian:stable-slim as deb-img

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8


docker build -t deb-img .

docker images - 90MB

docker run -dt --name deb-cont deb-img

docker exec -it deb-cont bash

cat /etc/os-release - Debian 10 e com UTF-8

## busybox

uclibc - 746.71KB

musl - 825.83MB

Dockerfile

FROM busybox

docker build -t busy-img .

docker iamges - 1.23 MB

docker run -dt --name busy-cont busy-img

docker exec -it busy-cont sh

http://crunchtools.com/comparison-linux-container-images/
https://www.infoworld.com/article/3235229/review-the-best-linux-distros-for-docker-and-containers.html
