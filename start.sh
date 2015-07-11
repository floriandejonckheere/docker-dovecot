#!/bin/bash

function handler() {
  echo -e "\e[31mError on line $LINENO\e[0m"
  exit 1
}

trap handler ERR

echo -e "\e[33mSetting correct permissions...\e[0m"
touch /var/log/mail.{log,err,warn}
chown syslog:adm /var/log/mail.*

echo -e "\e[33mStarting dovecot...\e[0m"
dovecot -F
