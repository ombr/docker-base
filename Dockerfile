FROM heroku/heroku:16
MAINTAINER Luc Boissaye <luc@boissaye.fr>

# RUN apt-get install -y build-essential qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic libxml2-dev libxslt1-dev && apt-get -y autoclean


RUN apt-get update -qq && \
  apt-get install -y -q --no-install-recommends \
    build-essential\
    libpq-dev\
    libxml2-dev\
    libxslt1-dev\
    nodejs\
    npm \
    qt5-default\
    libqt5webkit5-dev\
    gstreamer1.0-plugins-base\
    gstreamer1.0-tools\
    gstreamer1.0-x\
    xvfb \
  && rm -rf /var/lib/apt/lists/* \
  && truncate -s 0 /var/log/*log

# Ruby heroku
RUN apt remove -y --purge ruby && curl -s --retry 3 -L https://heroku-buildpack-ruby.s3.amazonaws.com/heroku-16/ruby-2.3.4.tgz | tar -xz

# Node heroku
RUN export NODE_VERSION=6.11.0 && \
  curl -s --retry 3 -L https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz -o /tmp/node-v$NODE_VERSION-linux-x64.tar.gz && \
  tar -xzf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /tmp && \
  rsync -a /tmp/node-v$NODE_VERSION-linux-x64/ / && \
  rm -rf /tmp/node-v$NODE_VERSION-linux-x64*

WORKDIR /var/app
