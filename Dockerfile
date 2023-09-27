FROM ubuntu:latest

WORKDIR /steamcmd

RUN apt update
RUN apt install libstdc++6 software-properties-common libgcc1 libcurl4-gnutls-dev wget -y
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install lib32gcc-s1 -y
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz

COPY run_dedicated_servers.sh /steamcmd
RUN chmod u+x /steamcmd/run_dedicated_servers.sh

EXPOSE 27000-27030
EXPOSE 4380
EXPOSE 10999

#CMD /steamcmd/run_dedicated_servers.sh