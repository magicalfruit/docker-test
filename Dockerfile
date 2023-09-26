FROM ubuntu:latest

WORKDIR /dst

RUN apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 -y
RUN mkdir steamcmd
WORKDIR /dst/steamcmd
RUN wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
RUN tar -xvzf steamcmd_linux.tar.gz
WORKDIR /dst

COPY run_dedicated_servers.sh /dst
RUN chmod u+x /dst/run_dedicated_servers.sh

CMD /dst/run_dedicated_servers.sh