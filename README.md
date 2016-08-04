**Application**

[MiniDLNA](http://minidlna.sourceforge.net/)

**Description**

ReadyMedia (formerly known as MiniDLNA) is a simple media server software, with the aim of being fully compliant with DLNA/UPnP-AV clients. It is developed by a NETGEAR employee for the ReadyNAS product line.

**Usage**
```
docker run -d \
    --net="host" \
    --name=<container name> \
    -v <path for media files>:/media:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    -e UPNP_NAME=<name for upnp server> \
    $IMAGENAME
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

N/A, CLI only.

**Example**
```
docker run -d \
    --net="host" \
    --name=minidlna \
    -v /media/pictures:/media \
    -v /etc/localtime:/etc/localtime:ro \
    --user nobody \
    -e UPNP_NAME=media \
    $IMAGENAME
```

**Notes**

You cannot specify the port the docker container uses, it requires full access to the hosts nic and thus the -p flag is not used.
