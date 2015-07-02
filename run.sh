#!/bin/bash

# Use absolute paths, don't append slash
BASEDIR="$(pwd)"
CONFDIR="${BASEDIR}/etc"
DATADIR="${BASEDIR}/var"

# This command create a container using ALL configuration file overrides
docker run -d --name dovecot \
  -v ${CONFDIR}/dovecot/:/etc/dovecot/ \
  -v ${CONFDIR}/ssl/:/etc/ssl/ \
  -v ${CONFDIR}/mailname:/etc/mailname \
  -v ${DATADIR}/mail/:/var/mail/ \
  -p 0.0.0.0:25:25 \
  thalarion/dovecot
