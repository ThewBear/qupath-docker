FROM ubuntu:20.04

RUN apt-get update -yqq && apt-get install -yqq \
    curl default-jre nano unzip xz-utils \
    xvfb libxext6 libxi6 libxtst6 libxrender1

WORKDIR /root

RUN curl -s -L https://storage.googleapis.com/builds.webswing.org/releases/webswing-20.2.1.zip > webswing.zip \
    && unzip webswing.zip \
    && rm webswing.zip \
    && mv webswing-* webswing

RUN curl -s -L https://github.com/qupath/qupath/releases/download/v0.2.3/QuPath-0.2.3-Linux.tar.xz > QuPath.tar.xz \
    && tar xz QuPath.tar.xz \
    && rm QuPath.tar.xz \
    && mv QuPath-* webswing/apps/QuPath
