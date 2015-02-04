FROM ubuntu:14.04.1

MAINTAINER Ed Robinson <ed@reevoo.com>

RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8

# Install baseline packages and clean up
RUN apt-get update -q && apt-get install -qy\
      autoconf \
      build-essential \
      bzr \
      ca-certificates \
      curl \
      git \
      imagemagick \
      libbz2-dev \
      libcurl4-openssl-dev \
      libevent-dev \
      libffi-dev \
      libglib2.0-dev \
      libjpeg-dev \
      libmagickcore-dev \
      libmagickwand-dev \
      libmysqlclient-dev \
      libncurses-dev \
      libpq-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      mercurial \
      openssh-client \
      wget \
      zlib1g-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* &&\
    truncate -s 0 /var/log/*log
