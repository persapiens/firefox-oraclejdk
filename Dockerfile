FROM persapiens/oraclejdk:8u171
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install headless gui tools, firefox and create firefox folders
RUN apt-get update -qqy && \
  apt-get upgrade -qqy --no-install-recommends && \
  apt-get install -qqy xvfb libgconf-2-4 && \
  apt-get -qqy --no-install-recommends install firefox && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir /.cache /.dbus /.gconf /.mozilla /Desktop && \
  chmod -R 777 /.cache /.dbus /.gconf /.mozilla /Desktop

ADD xvfb-firefox /usr/bin/xvfb-firefox
RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox
