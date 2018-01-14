#!/bin/bash

# This entrypoint is used to synchronise the UID of the host's user
# with that of the running container. We need to do this because
# the authorized_keys file is to be mounted in, but it needs to
# maintain its tight permissions.

# however, we need to run the sshd command as root, so we don't make
# use of gosu here.

# source: https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

USER_ID="${LOCAL_USER_ID:-1001}"

echo "Starting with UID: $USER_ID"

useradd --shell /bin/bash -u "$USER_ID" -o -c '' -m git
export HOME=/home/git

chown -R git: /srv/git

/usr/sbin/sshd -D
