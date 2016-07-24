FROM alpine
MAINTAINER David Sawatzke <david@sawatzke.de>

RUN apk add --no-cache minidlna supervisor \
    # Add share group so the later deletion doesn't fail on the first run
    # The minidlna user is added by the packet installation
    && addgroup share


# Add minidlnad.conf template
ADD minidlnad.conf /
ADD supervisord.conf /etc/supervisor/
ADD init.sh /

VOLUME /media
# run script to set uid, gid and permissions
CMD ["/init.sh"]
