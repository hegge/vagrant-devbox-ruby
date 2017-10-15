FROM debian:stretch

RUN apt-get update && apt-get install -y \
  openssh-server

EXPOSE 22

RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd -D"]
