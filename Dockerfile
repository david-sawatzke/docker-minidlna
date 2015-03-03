FROM binhex/arch-base:2015030300
MAINTAINER binhex

# additional files
##################

# add start script - copies custom minidlna.conf file to host
ADD start.sh /home/nobody/start.sh

# add supervisor conf file for app
ADD minidlna.conf /etc/supervisor/conf.d/minidlna.conf

# add install bash script
ADD install.sh /root/install.sh

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/install.sh /home/nobody/start.sh && \
	/bin/bash /root/install.sh

# docker settings
#################

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /media to host defined media path (used to read/write to media library)
VOLUME /media

# run supervisor
################

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]