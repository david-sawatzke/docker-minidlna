FROM binhex/arch-base:20160611-01
MAINTAINER David Sawatzke <david@sawatzke.de>

# additional files
##################

# add supervisor conf file for app
ADD setup/supervisord.conf /etc/supervisor/

# add install bash script
ADD setup/root/*.sh /root/

# add start script - copies custom minidlna.conf file to host
ADD setup/nobody/*.sh /home/nobody/

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh /home/nobody/*.sh && \
	/bin/bash /root/install.sh

# docker settings
#################

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /media to host defined media path (used to read/write to media library)
VOLUME /media

# set permissions
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/root/init.sh"]