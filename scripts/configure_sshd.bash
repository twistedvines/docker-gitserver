#!/bin/bash

sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' \
  /etc/ssh/sshd_config

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' \
  /etc/ssh/sshd_config
