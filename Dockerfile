FROM debian:jessie

RUN apt-get update && apt-get install -y \
  openssh-server

EXPOSE 22

CMD ["/usr/sbin/sshd -D"]
