FROM ubuntu:14.04

MAINTAINER "Florian Dejonckheere <florian@floriandejonckheere.be>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get -y install dovecot-imapd dovecot-pop3d dovecot-ldap supervisor

# Create app structure
RUN mkdir -p /app/ /var/mail/ /etc/dovecot/ /var/log/supervisor/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /app/start.sh
RUN chmod a+x /app/start.sh

# Add vmail user
RUN groupadd -g 5000 vmail && useradd vmail -u 5000 -g vmail -s /sbin/nologin -d /var/mail/
RUN chmod 0777 /var/mail/
RUN chown -R vmail:vmail /var/mail/

# Dovecot init file
ADD etc/init.d/dovecot /etc/init.d/dovecot
RUN chmod a+x /etc/init.d/dovecot

VOLUME /var/mail/

EXPOSE 110 143 995 993

#CMD "/app/start.sh"
CMD "/usr/bin/supervisord"
