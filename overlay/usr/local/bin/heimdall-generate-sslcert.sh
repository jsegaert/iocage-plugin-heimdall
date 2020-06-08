#!/bin/sh
# Generate self-signed SSL certificate
# Restart NGINX for changes to take effect

BITS=4096
DAYS=3650
KEY_FILE="/usr/local/share/certs/heimdall-default.key"
CRT_FILE="/usr/local/share/certs/heimdall-default.crt"

COUNTRY="US"
ORGANIZATION="Plugins-R-Us"
ORG_UNIT="iocage-plugin-heimdall"
COMMON_NAME="localhost"
EMAIL="donotreply@localhost"

mkdir -p ${KEY_FILE%/*} ${CRT_FILE%/*}

openssl req -x509 -newkey rsa:$BITS -sha256 -days $DAYS -nodes -keyout $KEY_FILE -out $CRT_FILE \
       -subj "/C=$COUNTRY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"

chmod 600 $KEY_FILE
chmod 600 $CRT_FILE

