FROM alpine:3.4
MAINTAINER David Sawatzke <david@sawatzke.de>

RUN apk add --no-cache minidlna

# Add minidlnad.conf template
ADD minidlnad.conf /
ADD init.sh /

VOLUME /media
# run script to set uid, gid and permissions
CMD ["/init.sh"]
