FROM ubuntu:latest

ADD entrypoint.sh /opt/entrypoint.sh


ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
