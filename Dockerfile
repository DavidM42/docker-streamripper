FROM ubuntu
MAINTAINER Christian Lück <christian@lueck.tv>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	streamripper

RUN useradd -m -d /home/streamripper streamripper
USER streamripper
WORKDIR /home/streamripper

ENTRYPOINT ["streamripper"]
VOLUME /home/streamripper
