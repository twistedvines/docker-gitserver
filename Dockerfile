FROM debian as builder
RUN apt update && apt install -yy git openssh-server
RUN mkdir /run/sshd
COPY ./scripts/configure_sshd.bash /tmp/configure_sshd
RUN /tmp/configure_sshd
RUN rm -f /tmp/configure_sshd

FROM builder
COPY ./scripts/entrypoint.bash /usr/local/bin/entrypoint
VOLUME /srv/git
CMD entrypoint
