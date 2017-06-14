FROM heroku/heroku:16
MAINTAINER Luc Boissaye <luc@boissaye.fr>

WORKDIR /var/app

# RUN apt-get update -qq
# RUN apt-get install -y build-essential qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic libxml2-dev libxslt1-dev && apt-get -y autoclean


RUN apt-get update -qq && \
  apt-get install -y -q \
    build-essential\
    libpq-dev\
    libxml2-dev\
    libxslt1-dev\
    nodejs\
    qt5-default\
    libqt5webkit5-dev\
    gstreamer1.0-plugins-base\
    gstreamer1.0-tools\
    gstreamer1.0-x\
    xvfb \
  && rm -rf /var/lib/apt/lists/*
