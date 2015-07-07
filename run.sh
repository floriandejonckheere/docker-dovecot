#!/bin/bash

# Use absolute paths, don't append slash
BASEDIR="$(pwd)"
CONFDIR="${BASEDIR}/etc"
DATADIR="${BASEDIR}/var"
CERTDIR="/data/ssl/"

docker run -d --name dovecot \
	-v ${CONFDIR}/dovecot/:/etc/dovecot/ \
	-v ${CERTDIR}:/etc/ssl/:ro \
	-v ${CONFDIR}/mailname:/etc/mailname \
	-v ${DATADIR}/mail/:/var/mail/ \
	--dns=172.17.42.1 \
	-p 0.0.0.0:110:110 \
	-p 0.0.0.0:143:143 \
	-p 0.0.0.0:993:993 \
	-p 0.0.0.0:995:995 \
	--dns=172.17.42.1 \
	--hostname=dovecot.services.thalarion.be \
	thalarion/dovecot
