from ubuntu:20.04
MAINTAINER David M <example@example.com>

# install streamripper, gosu, and locales
RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper gosu && \
    apt-get install -y locales && \
    sed -i 's/# de_DE.UTF-8 utf-8/de_DE.UTF-8 utf-8/' /etc/locale.gen && \
    locale-gen de_DE.UTF-8

ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

RUN useradd -m -d /home/streamripper streamripper
WORKDIR /home/streamripper

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]
VOLUME /home/streamripper
