FROM debian as builder
RUN apt update && apt install -yy git openssh-server
RUN mkdir /run/sshd
COPY ./scripts/configure_sshd.bash /tmp/configure_sshd
RUN /tmp/configure_sshd
RUN rm -f /tmp/configure_sshd

FROM builder
RUN groupadd git
RUN useradd -m -g "git" -s /bin/bash "git"
RUN mkdir -p /srv/git && chown -R git: /srv/git
VOLUME /srv/git
CMD /usr/sbin/sshd -D
