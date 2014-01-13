# irssi
#

FROM ubuntu

MAINTAINER	Ayaz Ahmed Khan <ayaz [at] ayaz.pk>

RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list  
RUN apt-get update

RUN apt-get install -y irssi
RUN apt-get install -y ncurses-base ncurses-bin ncurses-term

RUN groupadd ayaz
RUN useradd -m -d /home/ayaz -g ayaz -s /bin/bash ayaz

RUN export TERM=screen
ENTRYPOINT ["irssi", "-c", "irc.freenode.net", "-p", "7000"]

USER ayaz

