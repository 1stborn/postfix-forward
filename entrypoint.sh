#!/bin/sh

postconf -e myhostname="$HOST"
postconf -e virtual_alias_domains="$DOMAINS"

# TLS parameters
postconf -e smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
postconf -e smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
postconf -e smtpd_use_tls=yes
postconf -e smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
postconf -e smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache

service rsyslog start
service postfix start

touch /var/log/mail.log /var/log/mail.err /var/log/mail.warn
chmod a+rw /var/log/mail.*
tail -F /var/log/mail.*
