FROM ubuntu:22.04
 
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential locales \
    python3 python3-dev python3-pip python3-wheel \
    curl \
 && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
 
ENV LANG ja_JP.UTF-8
ENV TZ JST-9

RUN apt-get install -y nodejs npm
RUN npm install -g n
RUN n stable
RUN apt-get purge -y nodejs npm

ADD . /map
