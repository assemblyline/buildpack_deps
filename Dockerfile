FROM quay.io/assemblyline/ubuntu:14.04.2

MAINTAINER Reevoo Devops <devops@reevoo.com>

RUN locale-gen en_GB.UTF-8 \
 && update-locale LANG=en_GB.UTF-8 LANGUAGE=en_GB.UTF-8 LC_ALL=en_GB.UTF-8 \
 && printf "path-exclude /usr/share/doc/*\npath-exclude /usr/share/man/*\npath-exclude /usr/share/info/*\npath-exclude /usr/share/lintian/*" >> /etc/dpkg/dpkg.cfg.d/nodoc \
 && cd /usr/share && rm -fr doc/* man/* info/* lintian/* \
 && apt-get update -q && apt-get install -qy --no-install-recommends \
   apt-transport-https \
   autoconf \
   bzip2 \
   ca-certificates \
   curl \
   g++ \
   gcc \
   git \
   imagemagick \
   libbz2-dev \
   libc6-dev \
   libcurl4-openssl-dev \
   libgdbm-dev \
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
   make \
   openssh-client \
   patch \
   wget \
   zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && truncate -s 0 /var/log/*log

ENV LANG      en_GB.UTF-8
ENV LANGUAGE  en_GB.UTF-8
ENV LC_ALL    en_GB.UTF-8
