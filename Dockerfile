FROM ubuntu:latest

WORKDIR /dst

RUN apt update
RUN apt install libstdc++6 libgcc1 libcurl4-gnutls-dev wget -y
RUN mkdir steamcmd
WORKDIR /dst/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
WORKDIR /dst

COPY run_dedicated_servers.sh /dst
RUN chmod u+x /dst/run_dedicated_servers.sh

EXPOSE 27000-27030
EXPOSE 4380
EXPOSE 10999

CMD /dst/run_dedicated_servers.sh