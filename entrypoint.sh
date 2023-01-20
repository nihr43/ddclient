#!/bin/bash

set -eu

cat > /etc/ddclient/ddclient.conf << EOF
ssl=yes
ttl=600
use=web, web=http://my.ip.fi/
protocol=googledomains
login=${DDCLIENT_LOGIN}
password=${DDCLIENT_PASSWORD}
${DDCLIENT_DOMAIN}
EOF

ddclient -foreground -verbose
