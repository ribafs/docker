# Configurar o timezone

Debian/Ubuntu - Para que seja configurado de forma não interativa na criação do container

ENV TZ 'America/Fortaleza'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

Outras sugestões

docker run -e TZ=America/Fortaleza ubuntu:20.04 date

# set noninteractive installation
export DEBIAN_FRONTEND=noninteractive
#install tzdata package
apt-get install -y tzdata
# set your timezone
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

-RUN apt-get update && \
+RUN DEBIAN_FRONTEND=noninteractive \
+    TZ=Asia/Singapore \
+    apt-get update && 
     apt-get install -y \

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tzdata

ARG DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends tzdata

ENV TZ=America/Fortaleza
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt instal....

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        tzdata \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add --no-cache tzdata
ENV TZ America/Los_Angeles

docker-compose.yml

volumes:
    - "/etc/timezone:/etc/timezone:ro"
    - "/etc/localtime:/etc/localtime:ro"

version: '3.7'
services:
  timezone:
    build: .
    environment:
      - TZ=America/New_York
      - DEBIAN_FRONTEND=noninteractive

# Set timezone as specified in /config/etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set the time zone
RUN echo "Europe/London" > /config/etc/timezone

ENV TZ 'Europe/Tallinn'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

ENV TZ=America/Los_Angeles

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add --no-cache tzdata && cp -r -f /usr/share/zoneinfo/America/Fortaleza /etc/localtime
