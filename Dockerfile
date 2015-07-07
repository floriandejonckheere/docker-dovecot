FROM ubuntu:14.04

MAINTAINER "Florian Dejonckheere <florian@floriandejonckheere.be>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get -y install dovecot-imapd dovecot-pop3d dovecot-ldap supervisor

# Create app structure
RUN mkdir -p /app/ /var/mail/ /etc/dovecot/ /var/log/supervisor/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add vmail user
RUN groupadd -g 5000 vmail && useradd vmail -u 5000 -g vmail -s /sbin/nologin -d /var/mail/
RUN chmod 0777 /var/mail/
RUN chown -R vmail:vmail /var/mail/

VOLUME /var/mail/

EXPOSE 110 143 995 993

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
