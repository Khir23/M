# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils \
    && apt-get clean

# Set up XRDP
RUN sed -i 's/3389/3389/g' /etc/xrdp/xrdp.ini && \
    echo "xfce4-session" >~/.xsession && \
    service xrdp start

# Expose the RDP port
EXPOSE 3389

# Start XRDP
CMD ["/usr/sbin/xrdp", "--nodaemon"]
