# Copyright (c) 2020 Avinal Kumar
#
# Distributed under the terms of GNU GPL 3.0 License
#
# The full license is in the file LICENSE, distributed with this software/package.

FROM ubuntu

# Image metadata
LABEL maintainer="Avinal Kumar"
LABEL github="https://github.com/avinal"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    aptitude \
    python \
    git \
    make \
    python3-pip \
    tzdata \
    openjdk-8-jdk \
    doxygen \
    perl-doc \
    pandoc

# install 
RUN pip3 install pelican \
    sphinx \
    ghp-import \
    wheel \
    sphinx-rtd-theme \
    sphinx-book-theme \
    docutils

COPY ./entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
