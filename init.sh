#!/bin/sh

# if name is not specified, then use the default name
if [ -z "$UPNP_NAME" ]; then
	UPNP_NAME=minidlna
fi

cp /minidlnad.conf /tmp/
sed -i -e "s/\${NAME}/$UPNP_NAME/g" /tmp/minidlnad.conf

# run minidlna
exec minidlnad -S -R -f /tmp/minidlnad.conf -P /tmp/minidlna.pid
