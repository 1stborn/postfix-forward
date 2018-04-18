FROM resin/rpi-raspbian:stretch
LABEL postfix latest

RUN apt-get update;  apt-get install -y apt-utils rsyslog postfix && \
	postconf -X smtpd_relay_restrictions && \
	postconf -X mydestination && \
	postconf -e virtual_alias_maps=hash:/etc/postfix/virtual
 
ADD virtual /etc/postfix/virtual
ADD entrypoint.sh /entrypoint.sh

RUN postmap /etc/postfix/virtual

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 25
