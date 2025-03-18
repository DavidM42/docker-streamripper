FROM debian:stretch
MAINTAINER David M <example@example.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper && \
    rm -rf /var/lib/apt/lists/*

run apt-get update && apt-get install -y locales && \
    sed -i 's/# de_DE.UTF-8 utf-8/de_DE.UTF-8 utf-8/' /etc/locale.gen && \
    locale-gen de_DE.UTF-8

RUN useradd -m -d /home/streamripper streamripper
USER streamripper
WORKDIR /home/streamripper

# expose relay port
EXPOSE 8000

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]
VOLUME /home/streamripper
