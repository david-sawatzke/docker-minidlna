#!/bin/sh

# if uid not specified then use default uid for user nobody
if [ -z "$PUID" ]; then
	PUID=99
fi

# if gid not specifed then use default gid for group users
if [ -z "$PGID" ]; then
	PGID=100
fi

# if name is not specified, then use the default name
if [ -z "$UPNP_NAME" ]; then
	UPNP_NAME=minidlna
fi

# As we can't modify users with busybox, we just delete the oldones and create
# new ones
deluser minidlna
delgroup share
addgroup -g $PGID share
adduser -u $PUID -s /bin/nologin -D -G share minidlna

cp /minidlnad.conf /tmp/
sed -i -e "s/\${NAME}/$UPNP_NAME/g" /tmp/minidlnad.conf
# run supervisor
exec supervisord -c /etc/supervisor/supervisord.conf
