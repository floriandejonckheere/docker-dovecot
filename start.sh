#!/bin/bash

function handler() {
  echo -e "\e[31mError on line $LINENO\e[0m"
  exit 1
}

trap handler ERR

echo -e "\e[33mSetting correct permissions...\e[0m"
touch /var/log/mail.{log,err,warn}
chown syslog:adm /var/log/mail.*
chown -R vmail:vmail /var/mail/

echo -e "\e[33mStarting rsyslog...\e[0m"
service rsyslog start
echo -e "\e[33mStarting Dovecot...\e[0m"
service dovecot start

echo -e "\e[33mStartup finished\e[0m"
tail -F /var/log/mail.*
