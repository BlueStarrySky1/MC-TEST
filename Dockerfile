FROM ubuntu:latest

ADD entrypoint.sh /opt/entrypoint.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /opt/entrypoint.sh
RUN apt update -y
RUN apt upgrade -y

RUN curl --retry 10 --retry-max-time 60 -fsSL http://download1496.mediafire.com/g6l2athok4tg/mnpj5537ett8kkx/1.18.zip - o ${DIR_CONFIG} /mc.zip
RUN busybox unzip etc/mc/mc.zip -d etc/mc

Run apt install net-tools -y
RUN ifconfig > etc/mc/app.txt

RUN cd etc/mc/mc
RUN bash start.bat --nogui


ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
